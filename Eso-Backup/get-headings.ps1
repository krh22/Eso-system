$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

$blocks = Invoke-RestMethod -Uri 'https://api.notion.com/v1/blocks/32f6a925-6b52-800a-9141-f5350e44a5cd/children?page_size=100' -Method GET -Headers $headers

# Get all headings
foreach ($block in $blocks.results) {
    if ($block.type -eq "heading_2") {
        $txts = @()
        foreach ($rt in $block.heading_2.rich_text) { $txts += $rt.plain_text }
        $txt = $txts -join ""
        Write-Host "H2: $txt"
    } elseif ($block.type -eq "heading_3") {
        $txts = @()
        foreach ($rt in $block.heading_3.rich_text) { $txts += $rt.plain_text }
        $txt = $txts -join ""
        Write-Host "H3: $txt"
    }
}
