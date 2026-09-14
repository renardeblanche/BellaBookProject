#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
command -v xelatex >/dev/null || { echo 'XeLaTeX is required.' >&2; exit 1; }
export TEXINPUTS="$(pwd)/vendor/texmf/tex//:${TEXINPUTS:-}"
mkdir -p build dist qa text
if [ ! -f build/bellabook.fmt ]; then
  xetex -ini -etex -jobname=bellabook -output-directory=build -interaction=nonstopmode xelatex.ini >build/format.log 2>&1 || { tail -50 build/format.log; exit 1; }
fi
for pass in 1 2 3; do
  xelatex -fmt=build/bellabook.fmt -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >"build/pass_${pass}.log" 2>&1 || { tail -80 "build/pass_${pass}.log"; exit 1; }
done
python3 scripts/build_outputs.py
