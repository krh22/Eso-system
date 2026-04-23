$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Check DATABASE page raw
$dbId = "3156a925-6b52-8123-83e3-fce69641b780"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$dbId/children?page_size=100" -Method GET -Headers $headers

$response | ConvertTo-Json -Depth 10 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\raw-db.json" -Encoding UTF8
Write-Host "Saved. Results: $($response.results.Count)"
