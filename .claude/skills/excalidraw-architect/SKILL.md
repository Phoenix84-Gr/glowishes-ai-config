---
name: excalidraw-architect
description: Generate valid .excalidraw JSON files from text descriptions, notes, or architecture plans. Use when user asks for a diagram, whiteboard, system map, flowchart, architecture drawing, or mentions Excalidraw. Output is a file the user can open at excalidraw.com or in the Excalidraw desktop app.
---

# Excalidraw Architect Skill

## Role
Convert text descriptions into valid `.excalidraw` JSON files. User drag-drops file into excalidraw.com or desktop app.

## Output
Always write the file to: `diagrams/<descriptive-name>.excalidraw`
Tell the user the file path and how to open it.

## JSON Schema

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [...],
  "appState": {
    "gridSize": null,
    "viewBackgroundColor": "#1a1b1e"
  },
  "files": {}
}
```

## Element Types

### Rectangle
```json
{
  "id": "unique_id",
  "type": "rectangle",
  "x": 100, "y": 100,
  "width": 300, "height": 65,
  "angle": 0,
  "strokeColor": "#339af0",
  "backgroundColor": "#1c4a8c",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 1,
  "opacity": 100,
  "groupIds": [],
  "frameId": null,
  "roundness": {"type": 3},
  "seed": 1001,
  "version": 1,
  "versionNonce": 1002,
  "isDeleted": false,
  "boundElements": [{"type": "text", "id": "text_id"}],
  "updated": 1700000000000,
  "link": null,
  "locked": false
}
```

### Text (contained in rectangle)
```json
{
  "id": "text_id",
  "type": "text",
  "x": 100, "y": 100,
  "width": 300, "height": 65,
  "angle": 0,
  "strokeColor": "#ffffff",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 1,
  "opacity": 100,
  "groupIds": [],
  "frameId": null,
  "roundness": null,
  "seed": 1003,
  "version": 1,
  "versionNonce": 1004,
  "isDeleted": false,
  "boundElements": null,
  "updated": 1700000000000,
  "link": null,
  "locked": false,
  "text": "Label text here",
  "fontSize": 16,
  "fontFamily": 2,
  "textAlign": "center",
  "verticalAlign": "middle",
  "baseline": 14,
  "containerId": "unique_id",
  "originalText": "Label text here",
  "lineHeight": 1.25
}
```

### Standalone Text
Same as above but:
- `containerId`: null
- `verticalAlign`: "top"
- `textAlign`: "left" (or "center" for centered titles)
- No `boundElements` on parent (none)

### Arrow
```json
{
  "id": "arrow_id",
  "type": "arrow",
  "x": 200, "y": 165,
  "width": 0, "height": 55,
  "angle": 0,
  "strokeColor": "#9775fa",
  "backgroundColor": "transparent",
  "fillStyle": "hachure",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 1,
  "opacity": 100,
  "groupIds": [],
  "frameId": null,
  "roundness": {"type": 2},
  "seed": 2001,
  "version": 1,
  "versionNonce": 2002,
  "isDeleted": false,
  "boundElements": null,
  "updated": 1700000000000,
  "link": null,
  "locked": false,
  "points": [[0, 0], [0, 55]],
  "lastCommittedPoint": null,
  "startBinding": null,
  "endBinding": null,
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```
- `points` are relative offsets from x,y. `[0,0]` is the start.
- For bidirectional: `startArrowhead: "arrow"`, `endArrowhead: "arrow"`
- For diagonal: `points: [[0,0],[dx,dy]]` where dx/dy is the offset to end point

### Diamond
Same fields as rectangle but `"type": "diamond"`.

### Ellipse
Same fields as rectangle but `"type": "ellipse"`.

### Line
Same as arrow but `"type": "line"`, `startArrowhead: null`, `endArrowhead: null`.

## Layout Rules

### Hierarchy (top-down)
```
Title (y=-200)
User box (y=-100)
Conductor/Orchestrator (y=0)
Domain headers (y=150)
Skills per domain (y=230, 310, 390...)
Wide bars: Memory / Automation / Integrations (y=480+)
```

### Column grid
For N domains:
- Column width: 280-320px
- Gap: 20px
- Start x: 50
- Column n left edge: 50 + n*(col_width + gap)

### Binding text to containers
1. Rectangle gets: `"boundElements": [{"type": "text", "id": "TEXT_ID"}]`
2. Text gets: `"containerId": "RECT_ID"`, x/y/width/height match the container

### Color scheme (dark theme)
Background: `#1a1b1e`

| Domain | Stroke | Header BG | Skill BG |
|--------|--------|-----------|----------|
| Social | #7048e8 | #3d2a7c | #2a1c5c |
| SEO/Blog | #2f9e44 | #1d5c29 | #163d1a |
| Products | #e67700 | #7d3f00 | #4d2800 |
| Email | #1971c2 | #0d3d6e | #08253d |
| Orders | #c92a2a | #6e1414 | #3d0a0a |
| B2B | #0c8599 | #064a54 | #032a30 |
| Dev | #c2255c | #6e132e | #3d0a1a |
| You/CEO | #9775fa | #5f3dc4 | — |
| Claude | #339af0 | #1c4a8c | — |
| Codex | #51cf66 | #1a5c28 | — |

### Font sizes
- Title: 36px
- Section label: 18-20px
- Domain header: 18px
- Skill box: 14px
- Small label: 11px
- Wide bars: 14px

### fontFamily values
- 1 = Virgil (hand-drawn style)
- 2 = Helvetica (clean)
- 3 = Cascadia (monospace)

### roughness values
- 0 = perfect/clean
- 1 = slightly hand-drawn
- 2 = very rough

### roundness
- Rounded corners: `{"type": 3}`
- Sharp corners: `null`

## Seed values
Use incrementing integers. Start at 1001. Each element uses 2 seeds (seed + versionNonce = seed+1).

## baseline formula
`baseline = Math.floor(fontSize * lineHeight)` or approximately `fontSize * 0.9`

## Workflow
1. Analyze the user's description → identify hierarchy, domains, connections
2. Plan layout: columns, rows, coordinates
3. Generate JSON elements in order: titles → orchestrators → domains → skills → bars
4. Write to `diagrams/<name>.excalidraw`
5. Tell user: "Open at excalidraw.com → drag and drop the file"

## Example: Simple 2-box with arrow
```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [
    {"id":"r1","type":"rectangle","x":100,"y":100,"width":200,"height":60,"angle":0,"strokeColor":"#339af0","backgroundColor":"#1c4a8c","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"roundness":{"type":3},"seed":1001,"version":1,"versionNonce":1002,"isDeleted":false,"boundElements":[{"type":"text","id":"t1"}],"updated":1700000000000,"link":null,"locked":false},
    {"id":"t1","type":"text","x":100,"y":100,"width":200,"height":60,"angle":0,"strokeColor":"#ffffff","backgroundColor":"transparent","fillStyle":"solid","strokeWidth":1,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"roundness":null,"seed":1003,"version":1,"versionNonce":1004,"isDeleted":false,"boundElements":null,"updated":1700000000000,"link":null,"locked":false,"text":"Box A","fontSize":16,"fontFamily":2,"textAlign":"center","verticalAlign":"middle","baseline":14,"containerId":"r1","originalText":"Box A","lineHeight":1.25},
    {"id":"a1","type":"arrow","x":200,"y":160,"width":0,"height":60,"angle":0,"strokeColor":"#ffffff","backgroundColor":"transparent","fillStyle":"hachure","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"roundness":{"type":2},"seed":2001,"version":1,"versionNonce":2002,"isDeleted":false,"boundElements":null,"updated":1700000000000,"link":null,"locked":false,"points":[[0,0],[0,60]],"lastCommittedPoint":null,"startBinding":null,"endBinding":null,"startArrowhead":null,"endArrowhead":"arrow"},
    {"id":"r2","type":"rectangle","x":100,"y":240,"width":200,"height":60,"angle":0,"strokeColor":"#51cf66","backgroundColor":"#1a5c28","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"roundness":{"type":3},"seed":1005,"version":1,"versionNonce":1006,"isDeleted":false,"boundElements":[{"type":"text","id":"t2"}],"updated":1700000000000,"link":null,"locked":false},
    {"id":"t2","type":"text","x":100,"y":240,"width":200,"height":60,"angle":0,"strokeColor":"#ffffff","backgroundColor":"transparent","fillStyle":"solid","strokeWidth":1,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"roundness":null,"seed":1007,"version":1,"versionNonce":1008,"isDeleted":false,"boundElements":null,"updated":1700000000000,"link":null,"locked":false,"text":"Box B","fontSize":16,"fontFamily":2,"textAlign":"center","verticalAlign":"middle","baseline":14,"containerId":"r2","originalText":"Box B","lineHeight":1.25}
  ],
  "appState": {"gridSize":null,"viewBackgroundColor":"#1a1b1e"},
  "files": {}
}
```
