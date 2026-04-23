$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get first 50 results without filter
$searchBody = @{
    page_size = 50
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

Write-Host "Total: $($response.results.Count)"

# Output first 10 to see what we get
$response.results[0..9] | ForEach-Object {
    $title = "Untitled"
    if ($_.properties.title.title.Count -gt 0) {
        $title = $_.properties.title.title[0].plain_text
    }
    Write-Host "$($_.id.Substring(0,8)) | $title"
}
