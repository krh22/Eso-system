$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Get first 10 pages we know about
$pageIds = @(
    "31d6a925-6b52-8030-91fb-ef6c2572df0d",  # Meal data
    "3156a925-6b52-8123-83e3-fce69641b780",  # Database
    "3126a925-6b52-80f3-b325-e5afd273cef0",  # FOOD
    "32f6a925-6b52-800a-9141-f5350e44a5cd",  # BUILD ENERGY
    "3266a925-6b52-80a1-9ded-d26e2f8b52ea",  # MEALS
    "327ca925-6b52-80e2-b6b7-e3d8c0c0dac9",  # Automationas
    "327ca925-6b52-8005-a2ac-c7d3e7b9f7de"   # Data
)

foreach ($id in $pageIds) {
    Write-Host "`n=== $id ==="
    try {
        $blocks = Invoke-RestMethod -Uri "https://api.notion.com/v1/blocks/$id/children?page_size=10" -Method GET -Headers $headers
        Write-Host "Blocks: $($blocks.results.Count)"
        
        # Show block types
        $types = $blocks.results | ForEach-Object { $_.type } | Sort-Object -Unique
        Write-Host "Types: $($types -join ', ')"
    } catch {
        Write-Host "Error: $_"
    }
}
