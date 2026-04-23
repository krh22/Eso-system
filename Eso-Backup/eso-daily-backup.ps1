# Eso Daily Backup Script
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupName = "$timestamp-openclaw-backup.tar.gz"
$destination = "C:\Users\KARANJA"

# Check last backup - if more than 24 hours ago, run backup immediately
$lastBackup = Get-ChildItem "$destination\*.tar.gz" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$hoursSinceLastBackup = if ($lastBackup) { (New-TimeSpan -Start $lastBackup.LastWriteTime -End (Get-Date)).TotalHours } else { 999 }

if ($hoursSinceLastBackup -gt 24) {
    Write-Host "Last backup was $([math]::Round($hoursSinceLastBackup, 1)) hours ago. Running backup..."
    
    # Create OpenClaw backup
    openclaw backup create --output "$destination\$backupName"

    # Also copy workspace files directly
    $workspaceSrc = "C:\Users\KARANJA\.openclaw\workspace"
    $workspaceDest = "C:\Users\KARANJA\Eso-Backup\workspace-latest"

    if (Test-Path $workspaceDest) {
        Remove-Item $workspaceDest -Recurse -Force
    }
    Copy-Item -Path $workspaceSrc -Destination $workspaceDest -Recurse

    Write-Host "Backup complete: $backupName"
} else {
    Write-Host "Backup already done recently ($([math]::Round($hoursSinceLastBackup, 1)) hours ago). Skipping."
}
