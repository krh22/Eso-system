$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get FOOD page (child of BODY)
$foodId = "3126a925-6b52-80f3-b325-e5afd273cef0"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$foodId/children?page_size=100" -Method GET -Headers $headers

$response | ConvertTo-Json -Depth 8 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\body-food.json" -Encoding UTF8

Write-Host "=== FOOD (child of BODY) ==="
Write-Host "Total blocks: $($response.results.Count)"

# Show block types
$typeCounts = @{}
foreach ($block in $response.results) {
    $t = $block.type
    if (-not $typeCounts.ContainsKey($t)) { $typeCounts[$t] = 0 }
    $typeCounts[$t] = $typeCounts[$t] + 1
}
foreach ($k in $typeCounts.Keys) { Write-Host "  $k : $($typeCounts[$k])" }

# Show headings to find timetable
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
