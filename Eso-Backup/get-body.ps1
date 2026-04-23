$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get BODY child pages
$bodyId = "3106a925-6b52-8099-9cfb-d74f786aeda5"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$bodyId/children?page_size=50" -Method GET -Headers $headers

Write-Host "=== Child pages of BODY ==="
foreach ($block in $response.results) {
    if ($block.type -eq "child_page") {
        Write-Host "$($block.id) | $($block.child_page.title)"
    }
}

Write-Host "`nTotal: $($response.results.Count) blocks"
