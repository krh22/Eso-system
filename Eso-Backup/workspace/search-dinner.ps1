$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for pages containing food/meal
$searchBody = @{
    query = "dinner"
    page_size = 50
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "Search results for 'dinner': $($response.results.Count)"

foreach ($item in $response.results) {
    $objType = $item.object
    $title = "Untitled"
    
    if ($objType -eq "page") {
        if ($item.properties.title -and $item.properties.title.title.Count -gt 0) {
            $title = $item.properties.title.title[0].plain_text
        }
    } elseif ($objType -eq "database") {
        if ($item.title -and $item.title.Count -gt 0) {
            $title = $item.title[0].plain_text
        }
    }
    
    Write-Host "$objType | $title"
    Write-Host "  ID: $($item.id)"
}
