# ESO // SESSION_INITIALIZATION_PROTOCOL
# --------------------------------------------------

Write-Host ">> INITIALIZING_ESO_SYSTEM..." -ForegroundColor Cyan

# Check for Node.js
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "!! CRITICAL_ERROR: NODE.JS_NOT_FOUND" -ForegroundColor Red
    return
}

# Run the Bridge script to aggregate context
Write-Host ">> BUILDING_CONTEXT_BRIDGE..." -ForegroundColor Yellow
node ./worker/eso_bridge.js

# Wait for file generation
Start-Sleep -Seconds 1

# Check if file was created
$outFile = "./sessions/current_handoff.txt"
$dashboardPath = ".\dashboard\eso_v3_futuristic.html"

if (Test-Path $outFile) {
    Write-Host ">> BRIDGE_SYNC_COMPLETE" -ForegroundColor Green
    Write-Host ">> LAUNCHING_DASHBOARD_UI..." -ForegroundColor Green
    
    # Auto-launch Dashboard in App Mode (Chrome/Edge prioritized for windowed look)
    $absPath = (Resolve-Path $dashboardPath).Path
    if (Get-Command "chrome.exe" -ErrorAction SilentlyContinue) {
        Start-Process "chrome.exe" "--app=file:///$absPath"
    } elseif (Get-Command "msedge.exe" -ErrorAction SilentlyContinue) {
        Start-Process "msedge.exe" "--app=file:///$absPath"
    } else {
        Start-Process $dashboardPath
    }
    
    Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "CONSOLE LIVE // WINDOW_MODE_ACTIVE" -ForegroundColor Cyan
} else {
    Write-Host "!! ERROR: HANDOFF_GENERATION_FAILED" -ForegroundColor Red
}
