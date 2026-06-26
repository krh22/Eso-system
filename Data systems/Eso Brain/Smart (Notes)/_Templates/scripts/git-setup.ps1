# Git Setup Script for Eso Brain Vault
Write-Host "=== GIT SETUP FOR ESO BRAIN VAULT ===" -ForegroundColor Cyan
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) {
    Write-Host "[ERROR] Git is not installed. Download from: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
} else {
    Write-Host "[OK] Git is installed." -ForegroundColor Green
    git --version
}
$vaultPath = "C:\Users\KARANJA\Documents\Eso Brain"
Set-Location $vaultPath
if (Test-Path ".git") {
    Write-Host "[INFO] Git repository already initialized." -ForegroundColor Yellow
} else {
    Write-Host "[INFO] Initializing Git repository..." -ForegroundColor Cyan
    git init
    Write-Host "[OK] Git repository initialized." -ForegroundColor Green
}
$gitignoreContent = @"
# Obsidian
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache
.obsidian/hotkey.json
.obsidian/graph.json
# Logs
logs/action-log.md
logs/session-log.md
# System files
.DS_Store
Thumbs.db
desktop.ini
# Temporary files
*.tmp
*.temp
~$*
"@
$gitignorePath = Join-Path $vaultPath ".gitignore"
Set-Content -Path $gitignorePath -Value $gitignoreContent
Write-Host "[OK] .gitignore file created." -ForegroundColor Green
$status = git status --porcelain
if ($status) {
    Write-Host "[INFO] Making initial commit..." -ForegroundColor Cyan
    git add .
    git commit -m "Initial vault commit - Eso Brain setup"
    Write-Host "[OK] Initial commit created." -ForegroundColor Green
} else {
    Write-Host "[INFO] No changes to commit." -ForegroundColor Yellow
}
$scriptPath = Join-Path $vaultPath "_Templates\scripts\git-auto-commit.ps1"
$autoCommitScript = @'
Set-Location "C:\Users\KARANJA\Documents\Eso Brain"
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
$status = git status --porcelain
if ($status) {
    git commit -m "Auto-commit: $date"
    Write-Output "Committed changes at $date"
} else {
    Write-Output "No changes to commit at $date"
}
'@
Set-Content -Path $scriptPath -Value $autoCommitScript
Write-Host "[OK] Auto-commit script created at $scriptPath" -ForegroundColor Green
$taskName = "EsoBrain Auto Commit"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "8:00PM"
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Limited
try {
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description "Weekly auto-commit for Eso Brain vault" -Force
    Write-Host "[OK] Scheduled task '$taskName' created (runs every Sunday at 8:00 PM)." -ForegroundColor Green
} catch {
    Write-Host "[WARN] Could not create scheduled task. Run PowerShell as Administrator." -ForegroundColor Yellow
}
Write-Host "`n=== GIT SETUP COMPLETE ===" -ForegroundColor Cyan
Write-Host "Vault is now version-controlled with Git. Weekly auto-commit scheduled for Sunday 8:00 PM." -ForegroundColor Green
