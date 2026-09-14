"""Package the checked reading edition and its complete source project."""
from pathlib import Path
import difflib
import hashlib
import json
import shutil
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT.parents[1] / 'outputs'


def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(4 * 1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def main():
    report = json.loads((ROOT / 'qa/build_report.json').read_text())
    assert (ROOT / 'qa/visual_review.json').is_file(), 'Visual review is required.'
    checks = report['checks']
    assert checks['source_markers_complete']
    assert not any(checks[k] for k in checks if k != 'source_markers_complete')
    old = ROOT.parent / 'Spinosa_BellaBook_v17'
    if old.is_dir():
        patch = []
        for base in ['main.tex', 'bellabook.cls', 'frontmatter', 'chapters',
                     'appendices', 'scripts/build_outputs.py']:
            source = old / base
            for path in ([source] if source.is_file() else sorted(source.glob('*.tex'))):
                relative = path.relative_to(old)
                new = ROOT / relative
                patch.extend(difflib.unified_diff(
                    path.read_text().splitlines(True),
                    new.read_text().splitlines(True) if new.exists() else [],
                    fromfile='v17/' + str(relative), tofile='v18/' + str(relative)))
        (ROOT / 'qa/v18_changes.patch').write_text(''.join(patch))
    files = [p for p in sorted(ROOT.rglob('*')) if p.is_file()
             and not {'build', 'dist', '__pycache__'} & set(p.relative_to(ROOT).parts)
             and p.name != 'VERSION_MANIFEST.json']
    manifest = {
        'version': report['version'], 'source_range': [1, 546],
        'retypeset_source_pages': 546, 'retypeset_pdf_pages': report['retypeset_pdf_pages'],
        'editorial_notes': 627, 'original_notes': 60,
        'body_chapters_complete': True, 'bibliography_complete': True,
        'source_text_coverage_complete': True, 'scholarly_final_review_complete': False,
        'appendix_b_removed': True, 'appendix_a_references_continuous': True,
        'comparison_pdf_generated': False, 'checks': checks,
        'pdf_output': report['output'],
        'files': [{'path': str(p.relative_to(ROOT)), 'bytes': p.stat().st_size,
                   'sha256': digest(p)} for p in files],
    }
    manifest_path = ROOT / 'VERSION_MANIFEST.json'
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2))
    files.append(manifest_path)
    OUTPUT.mkdir(exist_ok=True)
    pdf = OUTPUT / 'Spinosa_BellaBook_v18_complete.pdf'
    shutil.copy2(ROOT / 'dist' / pdf.name, pdf)
    archive = OUTPUT / 'Spinosa_BellaBook_v18_complete_project.zip'
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as z:
        for p in files:
            z.write(p, Path(ROOT.name) / p.relative_to(ROOT))
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert any(n.endswith('/main.tex') for n in z.namelist())
        assert any(n.endswith('/source/original.pdf') for n in z.namelist())
    print(json.dumps({'pages': report['retypeset_pdf_pages'], 'source_files': len(files),
                      'outputs': [{'path': str(p), 'bytes': p.stat().st_size,
                                   'sha256': digest(p)} for p in (pdf, archive)]}, indent=2))


if __name__ == '__main__':
    main()
