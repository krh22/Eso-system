$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get PLAN (food) - likely has the timetable
$planId = "3156a925-6b52-80c1-9b41-e4f8b0e47d5b"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$planId/children?page_size=100" -Method GET -Headers $headers

$response | ConvertTo-Json -Depth 8 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\plan-food.json" -Encoding UTF8

Write-Host "=== PLAN (food) ==="
Write-Host "Total blocks: $($response.results.Count)"

# Show block types
$typeCounts = @{}
foreach ($block in $response.results) {
    $t = $block.type
    if (-not $typeCounts.ContainsKey($t)) { $typeCounts[$t] = 0 }
    $typeCounts[$t] = $typeCounts[$t] + 1
}
foreach ($k in $typeCounts.Keys) { Write-Host "  $k : $($typeCounts[$k])" }

# Show headings
Write-Host "`n=== Headings ==="
foreach ($block in $response.results) {
    if ($block.type -eq "heading_2") {
        $txt = ($block.heading_2.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H2] $txt"
    } elseif ($block.type -eq "heading_3") {
        $txt = ($block.heading_3.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H3] $txt"
    }
}
