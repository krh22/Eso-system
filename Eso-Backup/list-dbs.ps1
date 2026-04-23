$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for databases
$searchBody = @{
    query = ""
    page_size = 100
    filter = @{
        property = "object"
        value = "database"
    }
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "Total databases: $($response.results.Count)"
Write-Host ""

foreach ($db in $response.results) {
    $title = "No title"
    if ($db.title -and $db.title.Count -gt 0) {
        $title = $db.title[0].plain_text
    }
    Write-Host "$($db.id) | $title"
}
