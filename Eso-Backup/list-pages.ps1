$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for ALL pages in the workspace
$searchBody = @{
    query = ""
    page_size = 100
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "Total pages: $($response.results.Count)"
Write-Host ""

foreach ($page in $response.results) {
    $title = "No title"
    if ($page.properties.PSObject.Properties.Name -contains "title") {
        if ($page.properties.title -and $page.properties.title.title.Count -gt 0) {
            $title = $page.properties.title.title[0].plain_text
        }
    }
    Write-Host "$($page.id) | $title"
}
