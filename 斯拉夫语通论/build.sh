#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
# Requires XeLaTeX, xdvipdfmx, and the font families declared in bellabook_v3.cls.
# No font files are bundled.
for pass in 1 2; do
  xelatex -no-pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
done
xdvipdfmx -o main.pdf main.xdv
