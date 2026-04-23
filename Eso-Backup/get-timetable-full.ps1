$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get TIME TABLE page - ALL blocks
$timetableId = "32d6a925-6b52-80a9-841c-f1993c18c7ff"
$response = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$timetableId/children?page_size=100" -Method GET -Headers $headers

# Save full JSON
$response | ConvertTo-Json -Depth 10 | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\timetable.json" -Encoding UTF8

Write-Host "Saved timetable.json with $($response.results.Count) blocks"

# Find tables
$tableIndex = 0
foreach ($block in $response.results) {
    if ($block.type -eq "table") {
        $tableIndex++
        Write-Host "`n=== TABLE $tableIndex ==="
        Write-Host "  ID: $($block.id)"
        
        # Get table rows
        $tableId = $block.id
        $rows = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$tableId/children?page_size=50" -Method GET -Headers $headers
        
        Write-Host "  Rows: $($rows.results.Count)"
        
        foreach ($row in $rows.results) {
            if ($row.type -eq "table_row") {
                $cells = $row.table_row.cells
                $rowData = @()
                foreach ($cell in $cells) {
                    $cellText = @()
                    foreach ($text in $cell.rich_text) {
                        $cellText += $text.plain_text
                    }
                    $rowData += ($cellText -join "")
                }
                Write-Host "    $($rowData -join ' | ')"
            }
        }
    }
}
