$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get TIME TABLE page
$searchBody = @{
    query = "TIME TABLE"
    page_size = 10
} | ConvertTo-Json

$search = Invoke-RestMethod -Uri 'https://api.notion.com/v1/search' -Method POST -Headers $headers -Body $searchBody

$timetableId = $search.results[0].id

Write-Host "TIME TABLE ID: $timetableId"

# Get blocks
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$timetableId/children?page_size=100" -Method GET -Headers $headers

Write-Host "Total blocks: $($response.results.Count)"

# Show headings
Write-Host "`n=== Headings ==="
foreach ($block in $response.results) {
    if ($block.type -eq "heading_2") {
        $txt = ($block.heading_2.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H2] $txt"
    } elseif ($block.type -eq "heading_3") {
        $txt = ($block.heading_3.rich_text | ForEach-Object { $_.plain_text }) -join ""
        Write-Host "[H3] $txt"
    } elseif ($block.type -eq "table") {
        Write-Host "[TABLE] has_column_header: $($block.table.has_column_header), columns: $($block.table.table_width), rows (estimate)"
    }
}
