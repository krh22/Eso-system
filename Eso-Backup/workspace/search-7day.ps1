$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for BUILD ENERGY
$searchBody = @{
    query = "7-day"
    page_size = 20
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "=== Search: 7-day ==="
foreach ($item in $response.results) {
    if ($item.object -eq "page") {
        $title = "Untitled"
        if ($item.properties.title.title.Count -gt 0) {
            $title = $item.properties.title.title[0].plain_text
        }
        Write-Host "$($item.id) | $title"
    }
}

# Also search for SUPPR
$searchBody2 = @{
    query = "supper"
    page_size = 20
} | ConvertTo-Json

$response2 = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody2

Write-Host "`n=== Search: supper ==="
foreach ($item in $response2.results) {
    if ($item.object -eq "page") {
        $title = "Untitled"
        if ($item.properties.title.title.Count -gt 0) {
            $title = $item.properties.title.title[0].plain_text
        }
        Write-Host "$($item.id) | $title"
    }
}
