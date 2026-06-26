STATUS: Active | Last updated: 2026-04-21

## Main PC
Path: C:\Users\KARANJA\
Runs: everything — n8n, Ollama, git, all bots
Do NOT run automations anywhere else.

## Backup PC
Path: C:\Users\PC\ (secondary — currently active)
Runs: file editing, Obsidian, Antigravity sessions, dashboard view only

## Sync protocol (do this when switching machines)
1. Copy C:\Users\PC\Documents\Eso Body\ESO_CORE\ to flash drive
2. Copy C:\Users\PC\Documents\Eso Body\eso\sessions\ to flash drive
3. Copy C:\Users\PC\Documents\Ryan. readme\ to flash drive
4. On main PC: paste those three folders, replacing existing
5. n8n and Ollama pick up automatically

## Git sync
GitHub repo: https://github.com/krh22/eso-system.git
Secondary PC: git configured, gitignore set, waiting for main PC first push
Main PC: run these when you get there:
  git init
  git remote add origin https://github.com/krh22/eso-system.git
  git add .
  git commit -m "full system backup - main pc - first push"
  git branch -M main
  git push -u origin main
After main PC pushes, run on secondary PC:
  git pull origin main
Daily habit on any PC:
  Start: git pull
  End: git add . → git commit -m "note" → git push
