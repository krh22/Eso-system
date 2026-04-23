$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get GOALS (food)
$goalsId = "3156a925-6b52-80e4-8f3b-e2063fb2e689"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$goalsId/children?page_size=100" -Method GET -Headers $headers

Write-Host "=== GOALS (food) ==="
Write-Host "Total blocks: $($response.results.Count)"

# Show block types
$typeCounts = @{}
foreach ($block in $response.results) {
    $t = $block.type
    if (-not $typeCounts.ContainsKey($t)) { $typeCounts[$t] = 0 }
    $typeCounts[$t] = $typeCounts[$t] + 1
}
foreach ($k in $typeCounts.Keys) { Write-Host "  $k : $($typeCounts[$k])" }

# Show headings and child pages
Write-Host "`n=== Content ==="
foreach ($block in $response.results) {
    if ($block.type -eq "heading_2") {
        $txt = ($block.heading_2.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H2] $txt"
    } elseif ($block.type -eq "heading_3") {
        $txt = ($block.heading_3.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H3] $txt"
    } elseif ($block.type -eq "child_page") {
        Write-Host "[PAGE] $($block.child_page.title)"
    }
}
