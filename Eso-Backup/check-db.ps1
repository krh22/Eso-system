$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Check DATABASE page (3156a925-6b52-8123-83e3-fce69641b780)
$dbId = "3156a925-6b52-8123-83e3-fce69641b780"
$dbBlocks = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$dbId/children?page_size=100" -Method GET -Headers $headers

Write-Host "=== DATABASE PAGE ==="
Write-Host "Total blocks: $($dbBlocks.results.Count)"

# Show all blocks
for ($i = 0; $i -lt $dbBlocks.results.Count; $i++) {
    $block = $dbBlocks.results[$i]
    $type = $block.type
    
    if ($type -eq "heading_2") {
        $txts = @()
        foreach ($rt in $block.heading_2.rich_text) { $txts += $rt.plain_text }
        Write-Host "`n[H2] " + ($txts -join "")
    } elseif ($type -eq "heading_3") {
        $txts = @()
        foreach ($rt in $block.heading_3.rich_text) { $txts += $rt.plain_text }
        Write-Host "[H3] " + ($txts -join "")
    } elseif ($type -eq "paragraph") {
        $txts = @()
        foreach ($rt in $block.paragraph.rich_text) { $txts += $rt.plain_text }
        $txt = $txts -join ""
        if ($txt) { Write-Host $txt }
    } elseif ($type -eq "bulleted_list_item") {
        $txts = @()
        foreach ($rt in $block.bulleted_list_item.rich_text) { $txts += $rt.plain_text }
        Write-Host "  * " + ($txts -join "")
    }
}
