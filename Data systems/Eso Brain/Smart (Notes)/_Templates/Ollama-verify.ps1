# Ollama Setup and Verification Script
# Save as: _Templates/scripts/ollama-verify.ps1
# Run in PowerShell as Administrator

Write-Host "=== OLLAMA SETUP VERIFICATION ===" -ForegroundColor Cyan

$ollamaCmd = Get-Command ollama -ErrorAction SilentlyContinue
if (-not $ollamaCmd) {
    Write-Host "[ERROR] Ollama not installed. Download from https://ollama.com" -ForegroundColor Red
    exit 1
} else {
    Write-Host "[OK] Ollama is installed." -ForegroundColor Green
}

$ollamaProcess = Get-Process ollama -ErrorAction SilentlyContinue
if (-not $ollamaProcess) {
    Write-Host "[WARN] Ollama not running. Starting..." -ForegroundColor Yellow
    Start-Process "ollama" -ArgumentList "serve" -WindowStyle Hidden
    Start-Sleep -Seconds 5
    $ollamaProcess = Get-Process ollama -ErrorAction SilentlyContinue
    if ($ollamaProcess) {
        Write-Host "[OK] Ollama started." -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Could not start Ollama. Run 'ollama serve' manually." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "[OK] Ollama is running." -ForegroundColor Green
}

Write-Host "Checking models..." -ForegroundColor Cyan
$models = ollama list 2>$null
if ($models -match "llama3") {
    Write-Host "[OK] llama3 is available." -ForegroundColor Green
} else {
    Write-Host "[WARN] llama3 not found. Pulling now (may take several minutes)..." -ForegroundColor Yellow
    ollama pull llama3
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] llama3 pulled successfully." -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Failed to pull llama3." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "=== VERIFICATION COMPLETE ===" -ForegroundColor Cyan
Write-Host "Ollama running. llama3 available." -ForegroundColor Green
Write-Host "Ollama API: http://localhost:11434" -ForegroundColor Gray
Write-Host "Now configure Smart Connections in Obsidian." -ForegroundColor Gray