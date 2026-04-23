# ESO SOVEREIGN OS // FEATURES_DIRECTORY
**Version**: 5.3 // **Last Update**: 2026-04-12

Welcome to the **Sovereign Engine**. This is a catalog of every active feature currently running on your system.

---

## 🖥️ LAYER 1: THE COMMAND CENTER (DASHBOARD)
**Status**: ACTIVE (v5.3)
**Path**: `eso/dashboard/eso_v3_futuristic.html`
- **Minimalist HUD**: High-speed, terminal-inspired interface.
- **Mission List**: Auto-synced checklist. Any Obsidian task with `!!` is prioritized here.
- **Phase Monitoring**: Live progress bars for all 12 phases of system deployment.
- **Brain Dump Sorter**: Log thoughts directly into the system history.
- **Context Bridge**: One-click copy for AI context handoff.
- **Auto-Save Heartbeat**: 5-second loop to local memory with an exit-block safety prompt.
- **Windowed Mode**: Compact toggle for "Always-On-Top" operation.

## 🧠 LAYER 2: THE CONTEXT BRIDGE (WORKER)
**Status**: ACTIVE (v3.0)
**Path**: `eso/worker/eso_bridge.js`
- **Universal Sync**: Periodically parses your Obsidian vault and updates the dashboard.
- **AI Handoff Generator**: Produces `eso/sessions/current_handoff.txt` for external AIs like DeepSeek/Claude.
- **Directory Snapshotting**: Snapshots your file manifest so AIs never lose track of where things are.

## 🤖 LAYER 3: THE AUTOMATION LAYER (n8n)
**Status**: DEPLOYED / PENDING ACTIVATION
**Path**: `Eso Brain/03_Memory/n8n-workflows/`
- **01: Backup Reminder**: Weekly notification to secure your data.
- **02: File Change Logger**: Tracks every change inside your vault.
- **03: Daily Briefing**: Morning report of your top 3 missions.
- **04: Boredom Detector**: Flags projects that haven't been touched in 7 days.
- **05: Brain Dump Sorter**: Logic to categorize your `_Inbox` entries.
- **00: Master AI Bot**: Webhook-enabled Claude bot that talks directly to your vault.

## 🛡️ LAYER 4: SECURITY & RECOVERY
**Status**: ACTIVE
**Path**: `Eso Brain/_Templates/scripts/`
- **Git Auto-Commit**: Your vault is under version control.
- **Weekly Schedule**: Task Scheduler runs a commit every Sunday at 8:00 PM.
- **Recovery Log**: All system actions are written to `Eso Brain/logs/action-log.md`.

---

## 📋 UPCOMING_FEATURES
- [ ] **Inbox Cleaner [Confidence Logic]**: Autonomous file moving.
- [ ] **Heuristic Learning**: System learns your sorting patterns over time.
- [ ] **Voice HUD**: Integration with ElevenLabs/Whisper.
