$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Check FOOD page (3126a925-6b52-80f3-b325-e5afd273cef0)
$foodId = "3126a925-6b52-80f3-b325-e5afd273cef0"
$foodBlocks = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$foodId/children?page_size=100" -Method GET -Headers $headers

Write-Host "=== FOOD PAGE ==="
Write-Host "Total blocks: $($foodBlocks.results.Count)"

# Show first 30 blocks
for ($i = 0; $i -lt 30 -and $i -lt $foodBlocks.results.Count; $i++) {
    $block = $foodBlocks.results[$i]
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
