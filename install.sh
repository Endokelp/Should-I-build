#!/usr/bin/env bash
# Should I Build? — install all 3 required skills
set -e

echo "Installing Should I Build? + companion skills..."
echo ""

echo "[1/3] should-i-build..."
npx skills add YOUR_GITHUB_USERNAME/ShouldIBuild --skill should-i-build -g -y

echo "[2/3] last30days (community signal)..."
npx skills add mvanhorn/last30days-skill --skill last30days -g -y

echo "[3/3] deep-research (claim verification)..."
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y

echo ""
echo "Done. Verify with: npx skills list"
echo ""
echo "Optional: set SCRAPECREATORS_API_KEY for richer last30days coverage."
echo "  export SCRAPECREATORS_API_KEY=your_key_here"
