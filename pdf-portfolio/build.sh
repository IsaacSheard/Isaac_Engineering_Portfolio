#!/bin/bash
# Renders pdf-portfolio/portfolio.html to a PDF with headless Chrome.
# Usage: ./pdf-portfolio/build.sh [output.pdf]
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="${1:-$DIR/Isaac_Sheard_Portfolio.pdf}"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=10000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$OUT" "file://$DIR/portfolio.html" 2>/dev/null
echo "Wrote $OUT"
