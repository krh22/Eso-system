$headers = @{
    'Authorization' = 'Bearer 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'
    'Notion-Version' = '2022-06-28'
    'Content-Type' = 'application/json'
}

# Try database query on MEALS database
$mealsDbId = "3266a925-6b52-80a1-9ded-d26e2f8b52ea"

try {
    $queryBody = @{
        page_size = 20
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "https://api.notion.com/v1/databases/$mealsDbId/query" -Method POST -Headers $headers -Body $queryBody
    
    Write-Host "MEALS DB Results: $($response.results.Count)"
    
    foreach ($row in $response.results) {
        Write-Host "---"
        # Try to get Name property
        if ($row.properties.Name) {
            $nameTxt = $row.properties.Name.title | ForEach-Object { $_.plain_text } -join ""
            Write-Host "Name: $nameTxt"
        }
        # Show all properties
        foreach ($prop in $row.properties.PSObject.Properties) {
            $propName = $prop.Name
            $propValue = $prop.Value | ConvertTo-Json -Compress
            Write-Host "  $propName : $propValue"
        }
    }
} catch {
    Write-Host "Error: $_"
}
