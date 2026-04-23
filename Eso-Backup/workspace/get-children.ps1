$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get THE SYSTEM (food) child pages
$systemFoodId = "3156a925-6b52-8015-aa89-c27c0f42abb9"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$systemFoodId/children?page_size=10" -Method GET -Headers $headers

Write-Host "=== Child pages of THE SYSTEM (food) ==="
foreach ($block in $response.results) {
    if ($block.type -eq "child_page") {
        Write-Host "$($block.id) | $($block.child_page.title)"
    }
}
