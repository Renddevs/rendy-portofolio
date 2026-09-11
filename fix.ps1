$oldText = @"
<div class="feature-card w-100 d-flex flex-column p-0 overflow-hidden"
                        style="background: var(--bg-gradient-surface);">
"@
$oldText2 = @"
<div class="feature-card w-100 d-flex flex-column p-0 overflow-hidden"
                        style="background-color: var(--surface);">
"@
$newText = @"
<div class="feature-card w-100 d-flex flex-column p-0 overflow-hidden">
"@

Get-ChildItem -Filter *-detail.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # Try replacing both variants
    $content = $content -replace [regex]::Escape($oldText), $newText
    $content = $content -replace [regex]::Escape($oldText2), $newText
    
    Set-Content -Path $_.FullName -Value $content -NoNewline
}
