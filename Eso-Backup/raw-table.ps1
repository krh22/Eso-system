$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get raw table rows
$tableId = "32d6a925-6b52-8011-a173-ce22d99a81bf"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$tableId/children?page_size=50" -Method GET -Headers $headers

# Show full raw JSON for first row
$firstRow = $response.results[0]
$firstRow | ConvertTo-Json -Depth 15 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\raw-table-row.json" -Encoding UTF8

Write-Host "First row raw:"
$firstRow | ConvertTo-Json -Compress
