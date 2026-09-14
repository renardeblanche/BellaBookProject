# Build dependencies

These are unmodified upstream font and TeX package files used by this edition. Their notices and licenses are preserved in the files and in `fonts/*LICENSE*`, `fonts/*OFL*`, and `fonts/*COPYRIGHT*`.

- Noto CJK Sans / Serif: notofonts/noto-cjk, Simplified Chinese Regular and Bold OTF; SIL Open Font License 1.1.
- Charis SIL: CTAN charissil package; SIL Open Font License 1.1.
- TeX Gyre Termes, Heros, Cursor: CTAN tex-gyre package; GUST Font License.
- DejaVu Serif: installed DejaVu core fonts; accompanying copyright notice.
- xeCJK 3.9.1, ctex, babel-french, and hyphen-french: TeX Live 2023 final packages, https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final/archive/ . Package notices specify licenses.
- `texmf/tex/generic/config/language.dat` is a project configuration file enabling English and French hyphenation in the local XeLaTeX format.

The local format is generated from the installed XeTeX/LaTeX version by scripts/build.sh. It does not alter the system TeX installation.
