$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Check "Meal data" page
$mealId = "31d6a925-6b52-8030-91fb-ef6c2572df0d"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$mealId/children?page_size=100" -Method GET -Headers $headers

$response | ConvertTo-Json -Depth 8 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\meal-data.json" -Encoding UTF8
Write-Host "Meal data blocks: $($response.results.Count)"
