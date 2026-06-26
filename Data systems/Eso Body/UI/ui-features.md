# ESO Dashboard — UI features

## Version: v7.0 | Date: 2026-04-19

## Tabs and what they do

| Tab | What it does | How it works |
|-----|-------------|--------------|
| Today | Shows top 5 tasks scored by urgency | Auto-sorted from task list, urgent tasks surface first |
| Tasks | Full 20-task backlog, add/complete tasks | Urgency 1-5 + domain tag. Completed tasks strike through |
| Domains | 9 life domains with health status | Green dot = has log entry. Tap to add quick log |
| Stats | Life statistics & health metrics | Pulled from health.md placeholders (Water, Sleep, Gym, Weight) |
| Inbox | Brain dump input — AI sorts output | User types anything, basic categoriser labels it (task/idea/log/ref) |
| Terminal | Simulated command interface | Commands: help, status, progress, tasks, sync, date, clear |
| Brain map | Visual node graph of life domains | SVG fed from brain_graph.json — shows active vs inactive domains |
| Phases | Build phase progress bars | Pulled from PHASES constant — updates when STATUS.md changes |

## Functional Status Indicators
To maintain transparency, all interactive elements now feature a status dot:

| Indicator | Meaning | Current Examples |
|-----------|---------|------------------|
| <span style="color:#4d9fff">● Blue</span> | **Functional** | Tabs, Task adding/toggling, Domain logging, Context copy |
| <span style="color:#ff4d4d">● Red</span> | **Placeholder** | Real terminal execution, Brain map live sync, Ollama sorter |

## Right panel

| Panel | What it does |
|-------|-------------|
| Context box | Compressed system snapshot — copy into any AI to load context |
| System log | Live log feed from system.log — shows INFO/WARN/ERROR entries |

## Header elements

| Element | What it does |
|---------|-------------|
| Clock | Live time HH:MM:SS |
| Date | Current date + day of week |
| Progress pill | Average of all phase percentages |
| Sync pill | Reminds user to sync ESO_CORE/ + sessions/ |

## Boredom button
Located in Today tab. Detects which domains have no log entries.
Picks one randomly and prompts Ryan to do one small thing for it.

## Inbox AI categoriser
Currently: keyword-based local classification (task/idea/log/ref)
Planned: routes to Ollama on main PC once n8n workflow 06 is imported.
Every committed entry logs to system.log as [INFO][INBOX].

## Terminal commands
| Command | Output |
|---------|--------|
| help | Lists all commands |
| status | System version, progress, machine status |
| progress | All phases with percentages |
| tasks | Top 5 active tasks |
| sync | Step-by-step sync instructions |
| date | Current date and time |
| clear | Clears terminal output |

## What is NOT connected yet (requires main PC)
- Ollama inbox sorter (needs n8n workflow 06 running)
- Obsidian brain_graph.json live feed (needs local file server)
- Real terminal (needs Node.js backend on localhost)
- Auto file-paths sync (needs n8n workflow 10)

## Storage
Dashboard saves state to browser storage every 30 seconds.
Sync state by exporting from Context tab and importing on new machine.
