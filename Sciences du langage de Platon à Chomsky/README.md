# BellaBook v18 — 阅读整理版

Lionel Spinosa，《Sciences du langage : de Platon à Chomsky / 语言学导论：从柏拉图到乔姆斯基（法语版）》。

本版保留卷首、十六章正文、全部练习、词汇表与总书目。相对 v17，删除附录 B 和卷首进度说明；附录 A 将 E1–E69 连续排列，再集中列出待核事项。封面、页脚与正文不再显示版本进度、编辑标语及底本页界标记。词汇表兼容两参数与三参数条目，将词头和中文释义并排；局部收紧章首提纲与书目，减少空疏尾页。

正文原文与原注保持不变；部分新增校注仅删减过程性措辞。既有校勘结论和待核状态不变。保留“原”与“校”两套脚注编号、参考资料链接及不可见的底本定位锚点。

## 构建

需要 XeLaTeX（TeX Live 2023 或兼容版本）、通常的 LaTeX extra 包、Python 3 与 PyMuPDF；所需字体与兼容组件随工程提供，许可证见 vendor/。

```sh
python3 -m pip install -r requirements.txt
bash scripts/build.sh
```

输出：dist/Spinosa_BellaBook_v18_complete.pdf。脚本编译三遍，检查546个底本定位、缺字、越界与链接。仅生成全书重排稿。

## 文件

- main.tex、bellabook.cls、frontmatter/、chapters/、appendices/：排版源文件。
- assets/ 与 vendor/：图件、字体及兼容组件。
- source/original.pdf：内部校勘底本，不并入交付 PDF。
- source/page_coverage.csv：本版底本页码对照；source/notes_v18.json 为当前脚注索引。
- text/retypeset_v18.txt：本版可检索文本（不含图像内文字）。
- qa/build_report.json、qa/visual_review.json：本版构建与视觉检查记录。
- qa/v18_changes.patch、qa/v18_integrity.json：本版改动与正文保留核对。
- VERSION_MANIFEST.json：版本范围与文件校验值。

历史工作记录保留于源码工程；阅读 PDF 不包含批次进度说明。资料中标明待核的事项仍需原典复核。
