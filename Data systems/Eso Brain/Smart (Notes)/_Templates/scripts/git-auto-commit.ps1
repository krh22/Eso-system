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
