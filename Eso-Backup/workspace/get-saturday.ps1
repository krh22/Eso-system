$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

$blocks = Invoke-RestMethod -Uri 'https://api.notion.com/v1/blocks/32f6a925-6b52-800a-9141-f5350e44a5cd/children?page_size=100' -Method GET -Headers $headers

# Blocks 49-55 (SATURDAY is 49, SUNDAY is 56)
for ($i = 48; $i -le 55; $i++) {
    $block = $blocks.results[$i]
    $type = $block.type
    
    Write-Host "--- Block $($i+1) [$type] ---"
    
    if ($type -eq "heading_3") {
        $txts = @()
        foreach ($rt in $block.heading_3.rich_text) { $txts += $rt.plain_text }
        Write-Host "TITLE: " + ($txts -join "")
    } elseif ($type -eq "paragraph") {
        $txts = @()
        foreach ($rt in $block.paragraph.rich_text) { $txts += $rt.plain_text }
        $txt = $txts -join ""
        if ($txt) { Write-Host $txt }
    } elseif ($type -eq "bulleted_list_item") {
        $txts = @()
        foreach ($rt in $block.bulleted_list_item.rich_text) { $txts += $rt.plain_text }
        Write-Host "  * " + ($txts -join "")
    } elseif ($type -eq "numbered_list_item") {
        $txts = @()
        foreach ($rt in $block.numbered_list_item.rich_text) { $txts += $rt.plain_text }
        Write-Host "  # " + ($txts -join "")
    } elseif ($type -eq "to_do") {
        $txts = @()
        foreach ($rt in $block.to_do.rich_text) { $txts += $rt.plain_text }
        $checked = $block.to_do.checked
        Write-Host "  [$(if($checked){'x'}else{' '})] " + ($txts -join "")
    }
}
