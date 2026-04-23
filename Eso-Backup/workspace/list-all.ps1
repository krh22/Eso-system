$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get all pages
$searchBody = @{
    page_size = 100
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "==========================================="
Write-Host "        ALL NOTION PAGES"
Write-Host "==========================================="

$pages = @()
foreach ($item in $response.results) {
    if ($item.object -eq "page") {
        $title = "Untitled"
        if ($item.properties.title.title.Count -gt 0) {
            $title = $item.properties.title.title[0].plain_text
        }
        $pages += [PSCustomObject]@{
            Title = $title
            ID = $item.id
        }
    }
}

$pages | ForEach-Object { Write-Host "$($_.Title)" }
Write-Host ""
Write-Host "Total: $($pages.Count) pages"
