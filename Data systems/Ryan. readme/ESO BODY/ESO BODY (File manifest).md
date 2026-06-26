---
STATUS: Active | Last updated: 2026-04-23 | Updated by: Antigravity
---

# ESO BODY — File manifest
*Execution, logs, and device management.*

## 📂 Local files in this folder
| # | File name | What it does | How often to read | Status |
|---|-----------|-------------|-------------------|--------|
| 1 | ESO BODY (Devices and sync).md | Which PC does what, sync protocol step by step | When switching machines | Active |
| 2 | ESO BODY (Build log).md | Log of every build session — what was built and when | When reviewing progress | Active |
| 3 | ESO BODY (File manifest).md | This file — lists everything in the ESO BODY folder | When looking for a body file | Active |
| 4 | ESO BODY (Handover).md | Current execution layer state and next steps | Every body work session | Active |

---

## ⚙️ Primary Worker Scripts
*The underlying scripts that execute the system's logic.*

| Script | Path | Purpose | Status |
|---|---|---|---|
| `environment.js` | `Eso Body/Agents (worker)/environment.js` | Environment vars and config. | Active |
| `eso_bridge.js` | `Eso Body/Agents (worker)/eso_bridge.js` | Prepares context for AI sessions. | Active |
| `inbox_cleaner.js` | `Eso Body/Agents (worker)/inbox_cleaner.js` | Cleans and categorizes the inbox. | Active |
| `sync-paths.js` | `Eso Body/Agents (worker)/sync-paths.js` | Fixes paths for backup/main PC. | Active |
| `manifest_gen.js` | `Eso Body/Agents (worker)/manifest_gen.js` | Updates the master file manifest. | Active |

---

## 🛠️ Critical Execution Core (SYSTEM CORE)
*Core system files for identity, status, and instructions.*

| File | Path | Purpose | Status |
|---|---|---|---|
| `STATUS.md` | `Eso Brain/Agents/Brain dump (Inbox organizer )/SYSTEM CORE/STATUS.md` | System build progress. | Active |
| `WHO.md` | `Eso Brain/Agents/Brain dump (Inbox organizer )/SYSTEM CORE/WHO.md` | Ryan and Eso's identity logic. | Active |
| `claude-context.md`| `Eso Brain/Agents/Brain dump (Inbox organizer )/SYSTEM CORE/claude-context.md` | Compressed system context for AI. | Active |
| `file-paths.md` | `Eso Brain/Agents/Brain dump (Inbox organizer )/SYSTEM CORE/file-paths.md` | Path mapping for the framework. | Active |
| `personal-constitution.md` | `Eso Brain/Agents/Brain dump (Inbox organizer )/SYSTEM CORE/personal-constitution.md` | Ryan's core values and rules. | Active |

---

## 🕒 Session Logs & Audit
*Logs of active work and automated sessions.*

| File | Path | Purpose |
|---|---|---|
| `antigravity-session-log.md` | `Eso Body/logs (sessions)/antigravity-session-log.md` | Audit trail of agent actions. |
| `2026-04-12-refinement-build.md` | `Eso Body/logs (sessions)/2026-04-12-refinement-build.md` | Historical refinement log. |
| `rough_book.md` | `Eso Body/logs (sessions)/rough_book.md` | Scratchpad for active sessions. |

## 🖥️ User Interface
| File | Path | Purpose |
|---|---|---|
| `eso_dashboard_v7.html` | `Eso Body/UI/eso_dashboard_v7.html` | Interactive dashboard UI. |
| `eso_v3_futuristic.html`| `Eso Body/UI/eso_v3_futuristic.html`| Alternative futuristic UI. |
| `ui-features.md` | `Eso Body/UI/ui-features.md` | Log of UI features and updates. |
| `ui-log.txt` | `Eso Body/UI/ui-log.txt` | Text log for UI events. |
| `bg.png` | `Eso Body/UI/bg.png` | Background image for the UI. |

> [!NOTE]
> All files listed above were scanned and verified as non-empty. No empty files were found in the execution directories.

> [!TIP]
> For full operational details, failure recovery, and configuration, see [ESO MIND (Automations guide).md](../ESO%20MIND/ESO%20MIND%20(Automations%20guide).md).
