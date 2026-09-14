# From Calculus to Cohomology — BellaBook

完整重排工程。原著：Ib Madsen、Jørgen Tornehave，Cambridge University Press，1997。

## 内容与版式

- B5（176 × 250 mm），纯白背景，BellaBook 蓝／青色层级。
- 英文正文 21 章，附录 A–D，全部习题、参考文献与重建索引。
- 可检索、可复制的正文与 LaTeX 数学公式；原有插图作为独立图形文件保留。
- 原书定理、公式及习题编号保留；目录、引用与索引链接指向新版页码。
- 发现并确认的底本错误直接改正文，中文“校勘”脚注说明；出版后的进展标作“今按”。校勘不是对全部证明重新认证，也不表示已穷尽所有潜在错误。

## 编译

使用 XeLaTeX 和 MakeIndex（TeX Live 2024 或更新的完整安装，或功能等同的环境）：

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
makeindex main.idx
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

也可运行 `latexmk -xelatex main.tex`。无需 shell escape 或 Biber。常见依赖包括 fontspec、amsmath、amsthm、mathtools、geometry、tikz-cd、tcolorbox、titlesec、fancyhdr、hyperref、bookmark、enumitem、adjustbox、microtype 等。字体使用 Latin Modern、Nimbus Sans、DejaVu Serif 及附带的 Noto Serif CJK SC。

## 文件

- `main.tex`：累计主入口。
- `BellaBook.sty`、`BellaMath.sty`：版式与数学宏。
- `chapters/`：正文及四个附录，习题保持原书编排，不增加原书没有的解答。
- `pics/`：插图资源。
- `fonts/`：中文脚注字体及许可文本。
- `CORRECTIONS.md`、`qa/editorial-footnotes.json`：校勘与今按清单。
- `qa/transcription-to-bellabook.patch`：相对于公开转录工程的全部文本差异。
- `qa/pdf-report.json`、`qa/build.log`：交付版检查记录。
- `original/Source_scan.pdf`：用户提供的扫描底本，便于复核和续修。

## 来源

正文底本为用户提供的扫描本。可编辑录入参考公开工程：
https://github.com/zongpingding/From-Calculus-to-Cohomology_Ib-Madsen-and-J-rgen-Tornehave

所用上游快照：`965b0b8f555a1121322e746829d5f87ca053452d`。已对大量上标、符号、映射方向、漏词及引用等转录问题进行修订；差异记录与原书校勘脚注分别保存。原著文字及插图归原作者／出版方；排版重制不改变原有归属。xeCJK、ctexhook 的对应源文件存于 `vendor-sources/`。
