$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Try to query databases (different API endpoint)
# First, let's list all pages/databases user has access to
$searchBody = @{
    query = ""
    page_size = 100
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "=== All accessible pages/databases ==="

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
