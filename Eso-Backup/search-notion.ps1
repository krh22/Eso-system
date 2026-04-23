$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Search for supper/meal related content
$body = '{"query": "supper dinner", "page_size": 25}'
$response = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $body
$response.results | ForEach-Object { 
    $title = if ($_.properties.title) { $_.properties.title.title[0].plain_text } else { "Untitled" }
    $id = $_.id
    Write-Host "=== $title (ID: $id) ==="
}
