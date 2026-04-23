$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get Meal data page - has table
$mealId = "31d6a925-6b52-8030-91fb-ef6c2572df0d"
$blocks = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$mealId/children?page_size=20" -Method GET -Headers $headers

Write-Host "=== Meal Data (table) ==="

foreach ($block in $blocks.results) {
    if ($block.type -eq "table") {
        $tableId = $block.id
        Write-Host "Table ID: $tableId"
        
        # Get table rows
        $rows = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$tableId/children?page_size=50" -Method GET -Headers $headers
        
        Write-Host "Rows: $($rows.results.Count)"
        
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
                Write-Host ($rowData -join " | ")
            }
        }
    }
}
