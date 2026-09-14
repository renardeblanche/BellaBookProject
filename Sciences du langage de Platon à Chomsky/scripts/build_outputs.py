#!/usr/bin/env python3
"""Finalize the cumulative BellaBook PDF for v18.

This lightweight build intentionally does NOT create a typeset+full-scan comparison PDF.
The registered source scan remains in source/original.pdf only for collation/rebuilds.
"""
from __future__ import annotations
import csv, hashlib, json, re
from pathlib import Path
import fitz

ROOT = Path(__file__).resolve().parents[1]
DIST = ROOT / 'dist'
DIST.mkdir(exist_ok=True)
PREFIX = 'https://bellabook.invalid/source/'
SOURCE = ROOT / 'source/original.pdf'
COMPILED = ROOT / 'build/main.pdf'
EXPECTED_SOURCE_SHA = '8a9b5179ccfd0fa9c5beca9386dbaf5808f79bde1bb348e7297dad229332a0ea'
VERSION = '2026-09-11.v18'
SOURCE_START, SOURCE_END = 1, 546
NEW_START, NEW_END = 540, 546
OUT_NAME = 'Spinosa_BellaBook_v18_complete.pdf'

def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for part in iter(lambda: f.read(4 * 1024 * 1024), b''):
            h.update(part)
    return h.hexdigest()

def main() -> None:
    if not SOURCE.is_file() or not COMPILED.is_file():
        raise FileNotFoundError('Compile main.tex first and keep source/original.pdf in place.')
    if digest(SOURCE) != EXPECTED_SOURCE_SHA:
        raise ValueError('Registered source scan hash mismatch.')
    source = fitz.open(SOURCE)
    if len(source) != 546:
        raise ValueError('Expected the registered 546-page source scan.')
    typeset = fitz.open(COMPILED)

    # Source boundaries remain invisible named destinations in the reading PDF.
    destinations = typeset.resolve_names()
    page_map = {int(name[4:]): item['page'] + 1
                for name, item in destinations.items()
                if re.fullmatch(r'src-\d+', name)}
    expected = set(range(SOURCE_START, SOURCE_END + 1))
    if set(page_map) != expected:
        missing = sorted(expected - set(page_map))
        extra = sorted(set(page_map) - expected)
        raise ValueError(f'Unexpected coverage; missing={missing}, extra={extra}')

    out = DIST / OUT_NAME
    out.unlink(missing_ok=True)
    typeset.save(out, garbage=3, deflate=True)

    with (ROOT / 'source/page_coverage.csv').open('w', encoding='utf-8-sig', newline='') as f:
        w = csv.writer(f)
        w.writerow(['source_pdf_page', 'printed_page', 'status', 'retypeset_pdf_page', 'retypeset_printed_page'])
        for original in range(1, 547):
            if original < 5:
                printed = ['封面', '封底', '书名页', '版权页'][original - 1]
            elif original < 14:
                printed = f'卷首{original-4:03d}'
            elif original == 14:
                printed = '原书总目录'
            else:
                printed = f'{original-14:03d}'
            physical = page_map.get(original, '')
            label = typeset[physical-1].get_label() if physical else ''
            w.writerow([original, printed,
                        '初校转写' if physical else '未转写；扫描底本仅供内部校勘',
                        physical, label])

    (ROOT / 'text/retypeset_v18.txt').write_text(
        '\n\n'.join(f'=== 本版 PDF 第 {i+1} 页 / 页码 {p.get_label()} ===\n{p.get_text()}'
                    for i, p in enumerate(typeset)), encoding='utf-8')

    source_files = list((ROOT / 'frontmatter').glob('*.tex')) + [p for p in (ROOT / 'chapters').glob('*.tex') if '.pre' not in p.name]
    editorial_count = sum(f.read_text(encoding='utf-8').count('\\ednote{') for f in source_files)
    original_count = sum(f.read_text(encoding='utf-8').count('\\origfoot{') for f in source_files)
    new_files = [ROOT/'chapters/17_bibliographie.tex', ROOT/'frontmatter/publication.tex']
    new_editorial = sum(f.read_text(encoding='utf-8').count('\\ednote{') for f in new_files)
    new_original = sum(f.read_text(encoding='utf-8').count('\\origfoot{') for f in new_files)

    log_path = ROOT / 'build/pass_3.log'
    log = log_path.read_text(errors='replace') if log_path.exists() else ''
    text_outside = []
    bad_links = []
    with fitz.open(out) as check:
        for i, page in enumerate(check, 1):
            for word in page.get_text('words'):
                if word[0] < -0.5 or word[1] < -0.5 or word[2] > page.rect.width + 0.5 or word[3] > page.rect.height + 0.5:
                    text_outside.append({'page': i, 'word': word[4]})
            for link in page.get_links():
                if link.get('uri', '').startswith(PREFIX):
                    bad_links.append({'page': i, 'problem': 'placeholder source link'})
                if link['kind'] == fitz.LINK_GOTO and not 0 <= link['page'] < len(check):
                    bad_links.append({'page': i, 'problem': 'out-of-range target'})

    report = {
        'version': VERSION,
        'title': 'Sciences du langage : de Platon à Chomsky',
        'author': 'Lionel Spinosa',
        'status': '附录与阅读版面整理；既有校勘结论及待核状态保留',
        'source_pages_total': 546,
        'retypeset_source_range': [SOURCE_START, SOURCE_END],
        'retypeset_source_pages': SOURCE_END - SOURCE_START + 1,
        'new_source_ranges': [],
        'new_source_pages': 0,
        'retypeset_pdf_pages': len(typeset),
        'editorial_notes': editorial_count,
        'original_notes': original_count,
        'new_editorial_notes': 0,
        'new_original_notes': 0,
        'continuation_source_pdf_page': None,
        'checks': {
            'source_markers_complete': len(page_map) == SOURCE_END - SOURCE_START + 1,
            'overfull_box_warnings': len(re.findall(r'Overfull', log)),
            'missing_glyph_warnings': len(re.findall(r'Missing character', log)),
            'undefined_reference_warning': 'undefined reference' in log.lower(),
            'labels_need_rerun': 'Label(s) may have changed' in log,
            'text_outside_page': text_outside,
            'bad_internal_links': bad_links,
        },
        'output': {OUT_NAME: {'bytes': out.stat().st_size, 'sha256': digest(out)}},
        'comparison_pdf_generated': False,
    }
    (ROOT / 'qa/build_report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False, indent=2))

if __name__ == '__main__':
    main()
