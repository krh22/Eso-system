$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Pages to check for supper data
$pageIds = @(
    "31d6a925-6b52-8030-91fb-ef6c2572df0d",  # Meal data
    "3266a925-6b52-80a1-9ded-d26e2f8b52ea",  # MEALS
    "32f6a925-6b52-800a-9141-f5350e44a5cd",  # BUILD ENERGY
    "3156a925-6b52-8123-83e3-fce69641b780",  # Database
    "3126a925-6b52-80f3-b325-e5afd273cef0"   # FOOD
)

foreach ($id in $pageIds) {
    Write-Host "`n=== Fetching page: $id ==="
    try {
        $page = Invoke-RestMethod -Uri "https://api.notion.com/v1/pages/$id" -Method GET -Headers $headers
        $title = "No title"
        if ($page.properties.PSObject.Properties.Name -contains "title") {
            if ($page.properties.title.title.Count -gt 0) {
                $title = $page.properties.title.title[0].plain_text
            }
        }
        Write-Host "Title: $title"
        
        # Get page content (blocks)
        $blocks = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$id/children?page_size=100" -Method GET -Headers $headers
        Write-Host "Blocks count: $($blocks.results.Count)"
        
        # Show first few blocks
        $i = 0
        foreach ($block in $blocks.results) {
            $i++
            if ($i -le 20) {
                if ($block.paragraph) {
                    $txts = @()
                    foreach ($rt in $block.paragraph.rich_text) { $txts += $rt.plain_text }
                    $txt = $txts -join ""
                    if ($txt) { Write-Host "  [$i] $txt" }
                } elseif ($block.heading_2) {
                    $txts = @()
                    foreach ($rt in $block.heading_2.rich_text) { $txts += $rt.plain_text }
                    $txt = $txts -join ""
                    if ($txt) { Write-Host "  [H2] $txt" }
                } elseif ($block.heading_3) {
                    $txts = @()
                    foreach ($rt in $block.heading_3.rich_text) { $txts += $rt.plain_text }
                    $txt = $txts -join ""
                    if ($txt) { Write-Host "  [H3] $txt" }
                } elseif ($block.bulleted_list_item) {
                    $txts = @()
                    foreach ($rt in $block.bulleted_list_item.rich_text) { $txts += $rt.plain_text }
                    $txt = $txts -join ""
                    if ($txt) { Write-Host "  [•] $txt" }
                }
            }
        }
    } catch {
        Write-Host "Error: $_"
    }
}
