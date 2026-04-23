$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get FOOD page children
$foodId = "3126a925-6b52-80f3-b325-e5afd273cef0"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$foodId/children?page_size=20" -Method GET -Headers $headers

Write-Host "=== Child pages of FOOD ==="
foreach ($block in $response.results) {
    if ($block.type -eq "child_page") {
        Write-Host "$($block.id) | $($block.child_page.title)"
    }
}
