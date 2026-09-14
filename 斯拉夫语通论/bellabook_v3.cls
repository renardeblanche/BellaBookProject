\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bellabook_v3}[2026/09/05 BellaBook Unicode linguistic edition]
\LoadClass[UTF8,openany,11pt]{ctexbook}
% BellaBook: do not insert blank verso pages between structural divisions.
\let\cleardoublepage\clearpage
\RequirePackage[a4paper,top=22mm,bottom=23mm,left=23mm,right=23mm,headheight=15pt,headsep=6mm,footskip=11mm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\setmainfont{Noto Serif}
\setsansfont{Noto Sans}
\setmonofont{Noto Sans Mono}
\setCJKmainfont{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
\setCJKmonofont{Noto Sans Mono CJK SC}
\newfontfamily\LingFont{Noto Serif}
\newfontfamily\GlagFont{Noto Sans Glagolitic}
\newcommand{\glag}[1]{{\GlagFont #1}}
\RequirePackage{xcolor,tikz,graphicx,fancyhdr,titlesec,tcolorbox,enumitem,booktabs,longtable,array,setspace,hyperref,microtype,needspace,caption,tabularx,pdflscape,etoolbox}
\definecolor{BellaBlue}{HTML}{275D8C}
\definecolor{BellaDeep}{HTML}{173957}
\definecolor{BellaSky}{HTML}{DDEBF5}
\definecolor{BellaInk}{HTML}{25313A}
\definecolor{BellaGray}{HTML}{6B7780}
\hypersetup{unicode=true,colorlinks=true,linkcolor=BellaBlue,urlcolor=BellaBlue,pdfstartview=FitH,bookmarksopen=true}
\setstretch{1.20}
\setlength{\emergencystretch}{4em}
\tolerance=2500
\raggedbottom
\setlength{\parindent}{2em}
\setlength{\parskip}{0.18em}
\pagestyle{fancy}\fancyhf{}
\fancyhead[LE,RO]{\small\sffamily\color{BellaGray}\leftmark}
\fancyhead[LO,RE]{\small\sffamily\color{BellaGray}斯拉夫语通论}
\fancyfoot[C]{\sffamily\color{BellaGray}\thepage}
\renewcommand{\headrulewidth}{0.3pt}\renewcommand{\footrulewidth}{0pt}
\titleformat{name=\chapter,numberless}[display]
 {\bfseries\sffamily\color{BellaDeep}}{}{0pt}{\Huge}
 [\vspace{0.6ex}{\color{BellaBlue}\rule{\textwidth}{1.1pt}}]
\titleformat{\section}{\Large\bfseries\sffamily\color{BellaBlue}}{}{0pt}{}[\vspace{-0.5ex}{\color{BellaSky}\rule{\textwidth}{0.6pt}}]
\titleformat{\subsection}{\large\bfseries\sffamily\color{BellaDeep}}{}{0pt}{}
\newtcolorbox{bellanote}{colback=BellaSky!45,colframe=BellaBlue!70,boxrule=0.6pt,arc=1.5mm,left=2.5mm,right=2.5mm,top=1.5mm,bottom=1.5mm}
\newcommand{\sourcepage}[2]{}
\newcommand{\term}[1]{{\LingFont #1}}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}

% BellaBook linguistic-table rule: one base table font across the book.
% Width is solved by column design / landscape pages, never by whole-table scaling.
\setlength{\tabcolsep}{4.2pt}
\renewcommand{\arraystretch}{1.14}
\AtBeginEnvironment{tabular}{\small}
\AtBeginEnvironment{tabularx}{\small}
\AtBeginEnvironment{longtable}{\small}
\newcolumntype{C}{>{\centering\arraybackslash\LingFont}X}
\newcommand{\tablehead}[1]{\multicolumn{1}{c}{\bfseries #1}}
% Allow three-digit page numbers in the table of contents without overfull boxes.
\makeatletter
\renewcommand{\@pnumwidth}{2.6em}
\makeatother

% Batch143: pair multiple table footnote marks with their own hyperlink targets.
\makeatletter
\newcommand{\BellaFnMark}[1]{%
  \footnotemark
  \expandafter\xdef\csname BellaFnNum@#1\endcsname{\number\value{footnote}}%
  \expandafter\xdef\csname BellaFnHref@#1\endcsname{\Hy@footnote@currentHref}%
}
\newcommand{\BellaFnText}[2]{%
  \begingroup
  \expandafter\let\expandafter\Hy@footnote@currentHref\csname BellaFnHref@#1\endcsname
  \c@footnote=\csname BellaFnNum@#1\endcsname\relax
  \footnotetext{#2}%
  \endgroup
}
\makeatother
