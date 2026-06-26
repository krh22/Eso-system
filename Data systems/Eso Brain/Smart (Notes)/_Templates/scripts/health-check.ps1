# Second Brain Health Check Script
# Save as: _Templates/scripts/health-check.ps1
# Run anytime to see full system status
# Usage: .\health-check.ps1

$vault = "C:\Users\KARANJA\Documents\My Brain"
$pass = 0
$fail = 0
$warn = 0
$results = @()

function Check-File {
    param($label, $path, $required = $true)
    $full = Join-Path $vault $path
    if (Test-Path $full) {
        $script:pass++
        $results += [PSCustomObject]@{Status="OK    "; Label=$label; Path=$path}
    } elseif ($required) {
        $script:fail++
        $results += [PSCustomObject]@{Status="MISS  "; Label=$label; Path=$path}
    } else {
        $script:warn++
        $results += [PSCustomObject]@{Status="OPT   "; Label=$label; Path=$path}
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SECOND BRAIN HEALTH CHECK" -ForegroundColor Cyan
Write-Host "   $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# ROOT
Write-Host "[ ROOT ]" -ForegroundColor Yellow
Check-File "Personal constitution" "personal-constitution.md"
Check-File "Brain dump" "brain-dump.md"

# 01_Core_Self
Write-Host "[ 01_Core_Self ]" -ForegroundColor Yellow
Check-File "Personal constitution copy" "01_Core_Self\personal-constitution.md"
Check-File "Master AI profile" "01_Core_Self\master-ai-profile.md"
Check-File "Birth chart" "01_Core_Self\birth-chart.md"
Check-File "Vision 2034" "01_Core_Self\vision-2034.md" $false

# 02_Executive
Write-Host "[ 02_Executive ]" -ForegroundColor Yellow
Check-File "Master AI system prompt" "02_Executive\master-ai-system-prompt.md"
Check-File "Voice guidelines" "02_Executive\ryan-voice-guidelines.md"
Check-File "Communication templates" "02_Executive\communication-templates.md"

# 03_Memory
Write-Host "[ 03_Memory ]" -ForegroundColor Yellow
Check-File "Master AI architecture" "03_Memory\master-ai-architecture.md" $false
Check-File "n8n workflow 00 Master AI" "03_Memory\n8n-workflows\00-master-ai-workflow.json" $false
Check-File "n8n workflow 01 Backup" "03_Memory\n8n-workflows\01-backup-reminder.json"
Check-File "n8n workflow 02 File logger" "03_Memory\n8n-workflows\02-file-change-logger.json"
Check-File "n8n workflow 03 Briefing" "03_Memory\n8n-workflows\03-daily-briefing.json"
Check-File "n8n workflow 04 Boredom" "03_Memory\n8n-workflows\04-boredom-detector.json"
Check-File "n8n workflow 05 Brain dump" "03_Memory\n8n-workflows\05-brain-dump-sorter.json"

# 04_Agents
Write-Host "[ 04_Agents ]" -ForegroundColor Yellow
Check-File "AI tools directory" "04_Agents\ai-tools-directory.md"
Check-File "Normal prompt engineer" "04_Agents\normal-prompt-engineer.md"
Check-File "Project builder engineer" "04_Agents\project-builder-engineer.md"
Check-File "Learning quiz engineer" "04_Agents\learning-quiz-engineer.md"
Check-File "Agent executor engineer" "04_Agents\agent-executor-engineer.md"
Check-File "Background bots engineer" "04_Agents\background-bots-engineer.md"
Check-File "Tools and AI directory" "04_Agents\tools-and-ai-directory.md" $false

# 05_Governance
Write-Host "[ 05_Governance ]" -ForegroundColor Yellow
Check-File "Prompt engineer rules" "05_Governance\prompt-engineer-rules.md"
Check-File "Master builder delegation" "05_Governance\master-builder-delegation.md"

# 06_Mission_Control
Write-Host "[ 06_Mission_Control ]" -ForegroundColor Yellow
Check-File "Project checklist" "06_Mission_Control\project-checklist.md"
Check-File "Master file manifest" "06_Mission_Control\master-file-manifest.md"
Check-File "Parallel workflow" "06_Mission_Control\parallel-workflow.md"
Check-File "Messaging integration" "06_Mission_Control\messaging-integration.md"
Check-File "Smart connections setup" "06_Mission_Control\smart-connections-setup.md"

# 07_Life_Domains
Write-Host "[ 07_Life_Domains ]" -ForegroundColor Yellow
Check-File "Finance" "07_Life_Domains\finance.md"
Check-File "Health" "07_Life_Domains\health.md"
Check-File "Family" "07_Life_Domains\family.md"
Check-File "Spirituality" "07_Life_Domains\spirituality.md"
Check-File "Body" "07_Life_Domains\body.md"

# _Templates/scripts
Write-Host "[ _Templates/scripts ]" -ForegroundColor Yellow
Check-File "Ollama verify" "_Templates\scripts\ollama-verify.ps1"
Check-File "Git setup" "_Templates\scripts\git-setup.ps1"
Check-File "Health check (this file)" "_Templates\scripts\health-check.ps1"

# _Inbox
Write-Host "[ _Inbox ]" -ForegroundColor Yellow
Check-File "Universal inbox" "_Inbox\Universal Inbox.md"

# logs
Write-Host "[ logs ]" -ForegroundColor Yellow
Check-File "Action log" "logs\action-log.md"

# chats
Write-Host "[ chats ]" -ForegroundColor Yellow
Check-File "Chat log template" "chats\chat-log-template.md" $false

# Print results
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   RESULTS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

foreach ($r in $results) {
    if ($r.Status -like "OK*") {
        Write-Host "  OK     $($r.Label)" -ForegroundColor Green
    } elseif ($r.Status -like "MISS*") {
        Write-Host "  MISS   $($r.Label)  ($($r.Path))" -ForegroundColor Red
    } else {
        Write-Host "  OPT    $($r.Label)" -ForegroundColor Gray
    }
}

$total = $pass + $fail
$pct = if ($total -gt 0) { [math]::Round(($pass / $total) * 100) } else { 0 }

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SCORE: $pass / $total required files present ($pct%)" -ForegroundColor $(if ($pct -ge 80) {"Green"} elseif ($pct -ge 50) {"Yellow"} else {"Red"})
Write-Host "   OPTIONAL missing: $warn" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if ($fail -gt 0) {
    Write-Host "ACTION NEEDED: $fail required files missing." -ForegroundColor Red
    Write-Host "Check MISS items above and create them." -ForegroundColor Red
} else {
    Write-Host "All required files present. System healthy." -ForegroundColor Green
}
Write-Host ""