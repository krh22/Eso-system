$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get all blocks after SATURDAY heading (block 49)
$blocks = Invoke-RestMethod -Uri 'https://api.notion.com/v1/blocks/32f6a925-6b52-800a-9141-f5350e44a5cd/children?page_size=100' -Method GET -Headers $headers

# Show blocks 48-60 (Saturday section)
for ($i = 48; $i -lt 60; $i++) {
    if ($i -ge $blocks.results.Count) { break }
    $block = $blocks.results[$i]
    $type = $block.type
    
    Write-Host "--- [$i] $type ---"
    
    if ($type -eq "heading_3") {
        $txts = @()
        foreach ($rt in $block.heading_3.rich_text) { $txts += $rt.plain_text }
        Write-Host "HEADING: " + ($txts -join "")
    } elseif ($type -eq "paragraph") {
        $txts = @()
        foreach ($rt in $block.paragraph.rich_text) { $txts += $rt.plain_text }
        $txt = $txts -join ""
        if ($txt) { Write-Host $txt }
    } elseif ($type -eq "bulleted_list_item") {
        $txts = @()
        foreach ($rt in $block.bulleted_list_item.rich_text) { $txts += $rt.plain_text }
        Write-Host "* " + ($txts -join "")
    } elseif ($type -eq "table") {
        Write-Host "[TABLE]"
    } elseif ($type -eq "divider") {
        Write-Host "---"
    }
}
