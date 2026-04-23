$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for ALL objects
$searchBody = @{
    query = "meal supper food"
    page_size = 100
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "Total results: $($response.results.Count)"
Write-Host ""

foreach ($item in $response.results) {
    $objType = $item.object
    $title = "No title"
    if ($item.properties -and $item.properties.PSObject.Properties.Name -contains "title") {
        if ($item.properties.title -and $item.properties.title.title.Count -gt 0) {
            $title = $item.properties.title.title[0].plain_text
        }
    }
    Write-Host "$objType | $($item.id) | $title"
}
