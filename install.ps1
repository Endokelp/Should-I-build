# Should I Build? — install all 3 required skills (Windows PowerShell)
$ErrorActionPreference = "Stop"

Write-Host "Installing Should I Build? + companion skills..." -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/3] should-i-build..."
npx skills add Endokelp/Should-I-build --skill should-i-build -g -y

Write-Host "[2/3] last30days (community signal)..."
npx skills add mvanhorn/last30days-skill --skill last30days -g -y

Write-Host "[3/3] deep-research (claim verification)..."
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y

Write-Host ""
Write-Host "Done. Verify with: npx skills list" -ForegroundColor Green
Write-Host ""
Write-Host "Optional: set SCRAPECREATORS_API_KEY for richer last30days coverage."
Write-Host '  $env:SCRAPECREATORS_API_KEY = "your_key_here"'
