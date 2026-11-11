#!/bin/bash
# Renders pdf-portfolio/portfolio.html to a PDF with headless Chrome.
# Images are downscaled to print resolution first so the PDF stays under
# typical 5 MB application-portal upload limits.
# Usage: ./pdf-portfolio/build.sh [output.pdf]
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="${1:-$DIR/Isaac_Sheard_Portfolio.pdf}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

python3 - "$DIR" "$TMP" <<'EOF'
import os, re, sys
from PIL import Image
src_dir, tmp = sys.argv[1], sys.argv[2]
html = open(os.path.join(src_dir, "portfolio.html")).read()
os.makedirs(os.path.join(tmp, "img"), exist_ok=True)

def shrink(m):
    rel = m.group(1)
    path = os.path.normpath(os.path.join(src_dir, rel))
    if not os.path.exists(path):  # e.g. commented-out example markup
        return m.group(0)
    name = os.path.splitext(os.path.basename(rel))[0] + ".jpg"
    im = Image.open(path)
    if im.mode in ("RGBA", "LA", "P"):
        im = im.convert("RGBA")
        bg = Image.new("RGB", im.size, (255, 255, 255))
        bg.paste(im, mask=im.split()[-1])
        im = bg
    else:
        im = im.convert("RGB")
    im.thumbnail((1100, 1100))
    im.save(os.path.join(tmp, "img", name), "JPEG", quality=80, optimize=True)
    return 'src="img/' + name + '"'

html = re.sub(r'src="(\.\./assets/[^"]+)"', shrink, html)
open(os.path.join(tmp, "portfolio.html"), "w").write(html)
EOF

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=10000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$OUT" "file://$TMP/portfolio.html" 2>/dev/null
echo "Wrote $OUT ($(du -h "$OUT" | cut -f1))"
