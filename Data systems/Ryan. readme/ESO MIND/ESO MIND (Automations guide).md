STATUS: Active | Last updated: 2026-04-21

## The 10 n8n bots
01 master-ai-workflow — orchestrates all AI tasks — main PC only
02 backup-reminder — reminds to run backup — both PCs
03 file-change-logger — logs file changes — main PC only
04 daily-briefing — generates daily summary — main PC only
05 boredom-detector — detects idle time, suggests activity — main PC only
06 inbox-sorter — reads inbox, routes items via Ollama — main PC only
07 checklist-bot — re-sorts tasks by urgency — main PC only
08 log-bot — appends domain logs to system.log — main PC only
09 handover-bot — updates handover.md at session close — main PC only
10 paths-sync-bot — updates paths.json when files change — main PC only

## The 5 worker scripts
eso_bridge.js — generates context handoff from system files — run before AI session
inbox_cleaner.js — processes inbox items into domain files — run when inbox is full
sync-paths.js — detects machine and fixes broken paths — run on new machine
environment.js — identifies if you are on Main or Backup PC
manifest_gen.js — generates master file manifest — run after adding files
git-auto-commit.ps1 — commits all changes to Git — runs on schedule (main PC)

## How to check if bots are running
Open browser → localhost:5678 → check each workflow is toggled ON

## If a bot fails
1. Open localhost:5678
2. Click the failed workflow
3. Check execution log for error
4. Fix the path or config shown in the error
5. Re-activate the workflow

## On backup PC when bots are offline
Do manually: write logs directly in domain files, update handover.md yourself,
copy ESO_CORE\ and eso\sessions\ to flash drive when done.
