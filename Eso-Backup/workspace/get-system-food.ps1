$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get THE SYSTEM (food)
$systemFoodId = "3156a925-6b52-8015-aa89-c27c0f42abb9"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$systemFoodId/children?page_size=100" -Method GET -Headers $headers

$response | ConvertTo-Json -Depth 8 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\system-food.json" -Encoding UTF8

Write-Host "THE SYSTEM (food): $($response.results.Count) blocks"

# Show structure
$typeCounts = @{}
foreach ($block in $response.results) {
    $t = $block.type
    if (-not $typeCounts.ContainsKey($t)) { $typeCounts[$t] = 0 }
    $typeCounts[$t] = $typeCounts[$t] + 1
}
foreach ($k in $typeCounts.Keys) { Write-Host "  $k : $($typeCounts[$k])" }
