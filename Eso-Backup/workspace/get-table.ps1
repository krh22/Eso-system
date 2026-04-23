$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get Saturday table ID
$tableId = "32f6a925-6b52-804c-85bf-c2a44ae2df09"

# Get table rows with details
$tableRows = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$tableId/children?page_size=50" -Method GET -Headers $headers

Write-Host "Total rows: $($tableRows.results.Count)"

$i = 0
foreach ($row in $tableRows.results) {
    $i++
    if ($row.type -eq "table_row") {
        $cells = $row.table_row.cells
        Write-Host "Row $i has $($cells.Count) cells:"
        
        $j = 0
        foreach ($cell in $cells) {
            $j++
            $cellText = @()
            foreach ($text in $cell.rich_text) {
                $cellText += $text.plain_text
            }
            Write-Host "  Cell $j : '$($cellText -join '')'"
        }
    }
}
