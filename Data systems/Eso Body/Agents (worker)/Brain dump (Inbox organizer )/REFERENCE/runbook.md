# Eso Emergency Runbook

## SECTION 1 — System recovery

- **How to restore from backup (eso-daily-backup.ps1)**
  Run the script located in `Eso-Backup\` to extract the most recent `tar.gz` archive and overwrite corrupted directories.
- **How to verify system health (health-check.ps1)**
  Run `_Templates/scripts/health-check.ps1` to confirm all core files in the manifest exist and are intact.
- **What to do if handover.md is missing**
  Recreate it by pulling context from `ESO_CORE/STATUS.md`, `WHO.md`, and the `antigravity-session-log.md` entries to restore AI situational awareness.
- **What to do if n8n goes down**
  Ensure the process is running on `localhost:5678`. Restart the local n8n daemon and verify the 6 core workflows are activated.
- **What to do if Ollama goes down**
  Run `_Templates/Ollama-verify.ps1` to check the local API endpoint and restart the background process if needed.
- **What to do if the "Eso" offline AI forgets who it is**
  Run `ollama create eso -f "Eso Body\eso\Modelfile"`. This rebuilds the brain using your `WHO.md` file and `tinyllama`.
- **What to do if a file is missing from paths.json**
  Run an AI file audit using Antigravity to locate the missing file, then update the target path inside `eso/paths.json`.

## SECTION 2 — New machine setup

- Step-by-step: install Obsidian, n8n, Ollama, Node.js, Git
- Clone the vault
- Run git-setup.ps1
- Verify with health-check.ps1
- Copy AI_TOOLS/README.md to desktop as reference

## SECTION 3 — Domain emergencies

### food
- **What breaks:** Notion API connection fails or `meal-data.json` gets corrupted.
- **How to fix it:** Run `Eso-Backup/check-food.ps1` to debug and re-run `query-meals.ps1` to pull fresh data.
- **Where the data lives:** `Eso-Backup/meal-data.json`, `plan-food.json`, `system-food.json`.

### gym
- **What breaks:** Timetable sync fails or workout schedule doesn't appear.
- **How to fix it:** Validate the schedule in Notion and pull using `get-timetable.ps1`.
- **Where the data lives:** `Eso-Backup/timetable.json`, `body-food.json`.

### school
- **What breaks:** Deadlines or assignment schedules fail to trigger.
- **How to fix it:** Re-authenticate Notion API and run full workspace sync.
- **Where the data lives:** `Eso-Backup/timetable.json`.

### family
- **What breaks:** Reminder alerts fail.
- **How to fix it:** Check n8n webhook nodes and re-trigger manually.
- **Where the data lives:** Local markdown logs and `Eso Brain/07_Life_Domains/family.md`.

### health
- **What breaks:** Daily check-ins are missed.
- **How to fix it:** Restart the daily briefing n8n workflow.
- **Where the data lives:** `Eso-Backup/body-food.json`.

### relationships
- **What breaks:** Contact reminders misfire.
- **How to fix it:** Adjust CRON schedules in n8n automations.
- **Where the data lives:** `Eso Brain/07_Life_Domains/relationships.md` (to be established).

### philosophy
- **What breaks:** Identity core references are dropped by AI.
- **How to fix it:** Re-inject `WHO.md` and `personal-constitution.md`.
- **Where the data lives:** `Eso Body/ESO_CORE/WHO.md` and `Eso Brain/07_Life_Domains/personal-constitution.md`.

### adventure
- **What breaks:** Planning documents become detached.
- **How to fix it:** Rebuild links from `Universal Inbox.md`.
- **Where the data lives:** General vault notes.

### fun
- **What breaks:** Boredom detector fails to parse.
- **How to fix it:** Restart `04-boredom-detector.json` workflow.
- **Where the data lives:** `Eso Brain/07_Life_Domains/fun.md` (to be established).

## SECTION 4 — Version history

| version | date | what changed | who made the change |
|---|---|---|---|
| v1.0 | 2026-04-19 | Initial runbook | Antigravity |

## If the AI dies mid-session

Ryan's recovery steps (plain language, no jargon):
1. Open handover.md — read the last 5 lines.
2. Write a SESSION NOTE in the inbox using this format:
   SESSION NOTE — [today's date] [which AI you were using]
   Goal: [one line — what you were doing]
   Done: [what actually finished]
   Incomplete: [what didn't finish]
   Next: [first thing to do next session]
3. Save. The inbox sorter will route it automatically.
4. Next session: start any AI with "read handover.md then read the inbox".
5. You lose nothing. Continue.

## Manual file update guide (when no AI is available)
For each file type, how Ryan can update it himself in plain language:
- **Updating a log:** open domain file, add line at top: [date] | what happened | mood 1-5.
- **Updating checklist:** open project-checklist.md, add - [ ] task (domain: X, urgency: 1-5).
- **Updating handover:** open handover.md, overwrite the top 5 lines with session note format.
- **Adding to inbox:** open Universal Inbox.md, add one line, save.

## SECTION 5 — Hardware Drift Protocol (Syncing 2 PCs)

Use these steps when moving the Eso system between your **Main PC** and **Secondary PC**:

1. **The Sync Method**: Copy the entire Eso Brain and Eso Body folders. Paste them onto the target machine, overwriting existing folders.
2. **Environment Activation**: Open a terminal in Eso Body\ and run:
   
ode eso/worker/sync-paths.js
   This script will detect if you are on the primary machine (KARANJA) or backup machine (PC) and automatically fix all internal file paths.
3. **Automation Check**:
   - On the **Main PC**: n8n and Ollama are active. All bots (06-10) will function automatically.
   - On the **Secondary PC**: n8n and Ollama may be unavailable. You must switch to **Manual Update** mode (see Section 1 & Section 4).
4. **Verification**: Open iles-purpose.txt in your Documents folder. Check the "DEVICE CONTEXT" header to see which mode is currently active.

## AI session close — non-negotiable steps

Every AI closes a session by doing these 4 things in order:
1. Append session summary to antigravity-session-log.md
2. Overwrite top section of handover.md (15-line close protocol)
3. Regenerate claude-context.md
4. Update paths.json + file-paths.md if any files were created

If tokens are running low: do step 1 and 2 only. Never skip both.
Ryan-instructions.txt is never touched by any AI.
