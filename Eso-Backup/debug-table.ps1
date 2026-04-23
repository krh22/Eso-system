$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get the table block info
$blocks = Invoke-RestMethod -Uri 'https://api.notion.com/v1/blocks/32f6a925-6b52-800a-9141-f5350e44a5cd/children?page_size=100' -Method GET -Headers $headers
$tableBlock = $blocks.results[49]

# Get table children
$tableChildren = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$($tableBlock.id)/children?page_size=50" -Method GET -Headers $headers

# Output to file
$output = @"
Table Block ID: $($tableBlock.id)
Table has $($tableChildren.results.Count) rows

"@

foreach ($row in $tableChildren.results) {
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
        $output += ($rowData -join " | ") + "`n"
    }
}

$output | Out-File -FilePath "C:\Users\KARANJA\.openclaw\workspace\table-output.txt" -Encoding UTF8
Write-Host "Saved to file"
