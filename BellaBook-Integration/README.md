# 积分论 · BellaBook 全书可编辑 LaTeX 重排版

T. Claesson、L. Hörmander 著，黄明游译。底本为科学出版社 1987 年中译本，原著为 1970 年的 *Integrationsteori*。

本工程完整转写原书印刷第 1—98 页：三章正文、全部公式与证明、章内练习、附录、41 道综合练习及 41 条原有提示。前言及书名信息也已重排。正文全部采用原生 LaTeX，未嵌入扫描正文图片；附带的 `source.pdf` 仅用于对照，不参与编译。

本版采用 BellaBook 的白底、蓝色章节标识、青色定理标签、灰色页眉、宽留白及可点击目录。保留原章、节、定理与公式编号。正文按已确认的错误订正，29 条校勘脚注说明原页码和订正理由；原有译者注与编者注另行保留。原书漏号 2.6.8 按编者注保留。

## 编译

需要 Python 3，以及带 XeLaTeX 的常规 TeX Live 或 MiKTeX。打开终端，在本目录运行：

```bash
python build.py
```

脚本会连续编译三次，以更新目录和交叉引用，输出 `build/main.pdf`。Python 部分仅使用标准库，编译不需要联网。

也可将 `main.tex` 设为主文件，选择 XeLaTeX，连续编译三次：

```bash
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

工程使用 `geometry`、`fontspec`、`amsmath`、`amssymb`、`mathtools`、`bm`、`xcolor`、`fancyhdr`、`titlesec`、`enumitem`、`tikz`、`tcolorbox`、`hyperref` 和 `bookmark`。中文与西里尔文字体随工程附带，无需系统安装；数学字体使用 TeX 标准字体。

## 编辑入口

- `main.tex`：版式、封面、版本说明、目录及全书入口。
- `chapters/preface.tex`：前言。
- `chapters/ch01.tex`：第一章，原第 1—19 页。
- `chapters/ch02.tex`：第二章，原第 20—63 页。
- `chapters/ch03.tex`：第三章，原第 64—84 页。
- `chapters/appendix.tex`：附录，原第 85—88 页。
- `chapters/exercises.tex`：综合练习，原第 89—94 页。
- `chapters/hints.tex`：提示，原第 95—98 页；点击提示题号可返回题目。
- `notes.tex`：全部 29 条校勘脚注的文字；正文通过 `\Corr{编号}` 调用。
- `corrections.json`：校勘编号、原页码与脚注 LaTeX 的结构化记录。
- `page-map.json`：原印刷页、底本 PDF 页及本版 PDF 页的对应关系。
- `transcription-status.json`：逐页覆盖记录。
- `validation.json`：交付 PDF 的页数、文本、图像与导航检查结果。
- `fonts/`：字体及许可说明。
- `source.pdf`：未经修改的扫描底本。

原页边界以 `\SourcePage{原页码}` 保存在源码中，并生成 PDF 对照锚点。公式用 `\eqn{原公式号}{公式}` 定义，引用用 `\eref{原公式号}`。定理采用 `statement` 环境，仍可直接修改其中的所有文字和数学表达式。校勘记录的内部编号与 PDF 的脚注序号是两套编号，后者随章节和原有注释自动编排。

## 数学家姓名约定

俄／苏数学家使用西里尔字母，如 Лузин、Егоров；欧美数学家保留拉丁字母原文拼写，如 Riemann、Lebesgue、Hölder、Hörmander；日本数学家使用汉字。数学术语中的人名也遵循同一约定。

## 校读范围

已对照底本完成一轮转写与校读，订正能够由上下文、计算或反例确认的错误；未把校读视为对全书每个数学论证的独立形式化验证。后续修改正文后，请重新编译；若分页变化，随附的页码映射与检查记录也应相应更新。
