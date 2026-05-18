$ErrorActionPreference = "Stop"

function Write-Json($value) {
    $value | ConvertTo-Json -Depth 12 -Compress
}

function Deny-PreToolUse($reason) {
    Write-Json @{
        hookSpecificOutput = @{
            hookEventName = "PreToolUse"
            permissionDecision = "deny"
            permissionDecisionReason = $reason
        }
    }
}

function Deny-PermissionRequest($reason) {
    Write-Json @{
        hookSpecificOutput = @{
            hookEventName = "PermissionRequest"
            decision = @{
                behavior = "deny"
                message = $reason
            }
        }
    }
}

function Block-Prompt($reason) {
    Write-Json @{
        decision = "block"
        reason = $reason
    }
}

function Get-ToolText($inputData) {
    if ($null -eq $inputData.tool_input) {
        return ""
    }

    $parts = @()
    if ($inputData.tool_input.PSObject.Properties.Name -contains "command") {
        $parts += [string]$inputData.tool_input.command
    }
    if ($inputData.tool_input.PSObject.Properties.Name -contains "description") {
        $parts += [string]$inputData.tool_input.description
    }
    if ($parts.Count -eq 0) {
        $parts += ($inputData.tool_input | ConvertTo-Json -Depth 12 -Compress)
    }

    return ($parts -join "`n")
}

function Get-BlockedToolReason($text) {
    $patterns = @(
        @{
            Regex = "(?i)\bgit\s+reset\s+--hard\b|\bgit\s+checkout\s+--\b|\bgit\s+clean\s+-[^\r\n]*[fd]"
            Reason = "Blocked destructive git command. Ask the user explicitly before resetting, checking out, or cleaning files."
        },
        @{
            Regex = "(?i)\brm\s+-rf\b|\bRemove-Item\b[^\r\n]*(?:-Recurse|-r)\b[^\r\n]*(?:-Force|-f)\b|\brmdir\s+/s\b|\bdel\s+/s\b"
            Reason = "Blocked recursive destructive file command. Confirm the exact target with the user first."
        },
        @{
            Regex = "(?i)(Get-Content|type|cat|gc|more)\s+['""]?[^'\r\n""]*\.env(?:\.[^'\r\n""]*)?['""]?"
            Reason = "Blocked reading .env contents. Do not expose secrets or local credentials."
        },
        @{
            Regex = "(?i)(OPENAI_API_KEY|sk-proj-|sk-[A-Za-z0-9_-]{20,}|access_token|client_secret|refresh_token|password\s*=)"
            Reason = "Blocked potential secret exposure. Do not print, store, or commit credentials."
        }
    )

    foreach ($pattern in $patterns) {
        if ($text -match $pattern.Regex) {
            return $pattern.Reason
        }
    }

    return $null
}

function Get-BlockedPromptReason($prompt) {
    $patterns = @(
        @{
            Regex = "(?i)\b(sk-proj-|sk-[A-Za-z0-9_-]{20,}|OPENAI_API_KEY|access_token|client_secret|refresh_token)\b"
            Reason = "This looks like it may contain a secret or token. Remove the credential and try again."
        },
        @{
            Regex = "(?i)\b(publish|post|send\s+dm|reply\s+to\s+comments?|launch\s+ad|pause\s+ad|change\s+ad|change\s+price|update\s+stock|set\s+discount|modify\s+checkout|change\s+shipping)\b.*\b(now|automatically|without\s+approval|go\s+live)\b"
            Reason = "Glowishes is in draft-only mode. I can prepare an approval package, but public/social/Shopify/ad changes need explicit human approval."
        },
        @{
            Regex = "(?i)\b(cures?\s+acne|treats?\s+eczema|removes?\s+wrinkles|guaranteed\s+results|medical\s+treatment|dermatologist\s+approved|clinically\s+proven)\b"
            Reason = "This includes a high-risk cosmetic claim. Provide documented evidence or use safer Glowishes wording."
        }
    )

    foreach ($pattern in $patterns) {
        if ($prompt -match $pattern.Regex) {
            return $pattern.Reason
        }
    }

    return $null
}

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) {
    exit 0
}

try {
    $inputData = $rawInput | ConvertFrom-Json
} catch {
    exit 0
}

$eventName = [string]$inputData.hook_event_name

switch ($eventName) {
    "SessionStart" {
        Write-Json @{
            hookSpecificOutput = @{
                hookEventName = "SessionStart"
                additionalContext = "Glowishes workspace policy: operate draft-only; never publish posts, send DMs/comment replies, change ads, or alter Shopify/customer/money/compliance data without explicit human approval. Keep Instagram, TikTok, Meta/Facebook, and Meta Ads draft packages separate. Avoid risky cosmetic claims unless documented; prefer safe appearance/feel wording. Do not expose or store secrets."
            }
        }
    }
    "UserPromptSubmit" {
        $reason = Get-BlockedPromptReason ([string]$inputData.prompt)
        if ($reason) {
            Block-Prompt $reason
        }
    }
    "PreToolUse" {
        $reason = Get-BlockedToolReason (Get-ToolText $inputData)
        if ($reason) {
            Deny-PreToolUse $reason
        }
    }
    "PermissionRequest" {
        $reason = Get-BlockedToolReason (Get-ToolText $inputData)
        if ($reason) {
            Deny-PermissionRequest $reason
        }
    }
    "Stop" {
        Write-Json @{
            continue = $true
        }
    }
}

