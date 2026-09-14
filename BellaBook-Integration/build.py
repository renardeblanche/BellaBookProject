#!/usr/bin/env python3
"""Compile the editable book with XeLaTeX; no network or Python packages needed."""
from pathlib import Path
import shutil
import subprocess

root = Path(__file__).resolve().parent
engine = shutil.which('xelatex')
if engine is None:
    raise SystemExit('未找到 xelatex。请安装 TeX Live 或 MiKTeX，并把 XeLaTeX 加入 PATH。')
(root / 'build').mkdir(exist_ok=True)
for run in range(1, 4):
    log = root / 'build' / f'compile-{run}.txt'
    with log.open('w', encoding='utf-8') as output:
        result = subprocess.run(
            [engine, '-interaction=nonstopmode', '-halt-on-error',
             '-file-line-error', '-output-directory=build', 'main.tex'],
            cwd=root, stdout=output, stderr=subprocess.STDOUT,
        )
    if result.returncode:
        raise SystemExit(f'第 {run} 次编译失败，请查看 {log}')
print(root / 'build' / 'main.pdf')
