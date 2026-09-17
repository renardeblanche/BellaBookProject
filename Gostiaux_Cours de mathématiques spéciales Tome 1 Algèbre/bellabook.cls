\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bellabook}[2026/09/16 BellaBooks long-form class]
\LoadClass[11pt,twoside,openany]{book}

\RequirePackage[paperwidth=7.5in,paperheight=10in,inner=0.86in,outer=0.72in,top=0.82in,bottom=0.86in,headsep=0.22in,footskip=0.40in]{geometry}
% BellaBooks compact pagination: do not insert parity-only blank pages.
\let\cleardoublepage\clearpage
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{mathtools}
\RequirePackage{unicode-math}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{FreeSerif}
\setsansfont{Noto Sans}
\setmonofont{DejaVu Sans Mono}
\setmathfont{latinmodern-math.otf}[Path=/usr/share/texmf/fonts/opentype/public/lm-math/]
\setCJKmainfont{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}

\RequirePackage[french]{babel}
\frenchsetup{StandardItemLabels=true}
\RequirePackage{xcolor}
\definecolor{BellaLavender}{HTML}{E8DDF8}
\definecolor{BellaLavenderMid}{HTML}{B9A5D8}
\definecolor{BellaLavenderDeep}{HTML}{68507F}
\definecolor{BellaLavenderPale}{HTML}{F8F5FC}
\definecolor{BellaInk}{HTML}{2E2932}
\definecolor{BellaGray}{HTML}{6C6670}
\color{BellaInk}

\RequirePackage{microtype}
\RequirePackage{enumitem}
\RequirePackage{booktabs,tabularx,array}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{unicode=true,colorlinks=true,linkcolor=BellaLavenderDeep,urlcolor=BellaLavenderDeep,citecolor=BellaLavenderDeep,linktoc=all,pdfborder={0 0 0},pdftitle={Cours de mathématiques spéciales, tome 1 - Algèbre},pdfauthor={Bernard Gostiaux}}

\setlength{\parindent}{1.15em}
\setlength{\parskip}{0.20em}
\linespread{1.055}
\setlength{\emergencystretch}{1.2em}
\widowpenalty=10000
\clubpenalty=10000
\raggedbottom
\setlength{\headheight}{24pt}

\titleformat{\chapter}[display]
  {\normalfont\sffamily\bfseries\color{BellaInk}}
  {\begin{tikzpicture}[baseline]
     \fill[BellaLavender] (0,0) rectangle (1.25,0.46);
     \node[anchor=center,text=BellaLavenderDeep,font=\bfseries\sffamily\large] at (0.625,0.23) {CHAPITRE \thechapter};
   \end{tikzpicture}}
  {1.0ex}
  {\Huge\itshape\rmfamily\color{BellaLavenderDeep}}
  [\vspace{0.8ex}\color{BellaLavenderMid}\rule{\textwidth}{0.7pt}]
\titlespacing*{\chapter}{0pt}{-1.2em}{2.0em}

\titleformat{\section}{\Large\bfseries\sffamily\color{BellaLavenderDeep}}{\thesection.}{0.55em}{}
\titleformat{\subsection}{\large\bfseries\sffamily\color{BellaLavenderDeep}}{\thesubsection.}{0.55em}{}
\titlespacing*{\section}{0pt}{2.0em}{0.8em}
\titlespacing*{\subsection}{0pt}{1.6em}{0.6em}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\small\sffamily\color{BellaGray}\thepage\qquad ALGÈBRE}
\fancyhead[RO]{\small\sffamily\color{BellaGray}\nouppercase{\leftmark}\qquad\thepage}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\begin{tikzpicture}[baseline=-0.5ex]\fill[BellaLavenderMid] (0,0) rectangle (1.1,0.025);\end{tikzpicture}}
\fancypagestyle{plain}{%
  \fancyhf{}\fancyfoot[C]{\small\sffamily\color{BellaGray}\thepage}\renewcommand{\headrulewidth}{0pt}}

\newcommand{\BellaCorrection}[2]{#1\footnote{\textbf{校勘：}原文为“#2”。此处据语法、上下文或数学事实改正。}}
\newcommand{\BellaCorrectionNote}[3]{#1\footnote{\textbf{校勘：}原文为“#2”。#3}}

\newtcolorbox{logicbox}{enhanced,breakable,colback=BellaLavenderPale,colframe=BellaLavenderMid,boxrule=0.55pt,arc=2pt,left=8pt,right=8pt,top=6pt,bottom=6pt}
\newenvironment{axiomlist}{\begin{description}[leftmargin=4.3em,labelwidth=3.6em,labelsep=0.7em,font=\normalfont\itshape]}{\end{description}}


% Linked BellaBooks table of contents. This is a new navigation aid, not a reproduction
% of the 1993 printed Sommaire.
\renewcommand{\contentsname}{Table des matières}
\setcounter{tocdepth}{1}
\renewcommand{\cfttoctitlefont}{\hfill\Huge\itshape\rmfamily\color{BellaLavenderDeep}}
\renewcommand{\cftaftertoctitle}{\hfill\mbox{}\\[-0.2em]\color{BellaLavenderMid}\rule{\textwidth}{0.7pt}\vspace{1.2em}}
\renewcommand{\cftchapfont}{\sffamily\bfseries\color{BellaInk}}
\renewcommand{\cftchappagefont}{\sffamily\bfseries\color{BellaLavenderDeep}}
\renewcommand{\cftsecfont}{\small\sffamily\color{BellaInk}}
\renewcommand{\cftsecpagefont}{\small\sffamily\color{BellaLavenderDeep}}
\setlength{\cftbeforechapskip}{0.55em}
\setlength{\cftbeforesecskip}{0.12em}
\newcommand{\BellaSection}[1]{\section*{#1}\phantomsection\addcontentsline{toc}{section}{#1}}

\newcommand{\BellaFrontTitle}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\origpage}[1]{\marginpar{\raggedright\scriptsize\sffamily\color{BellaLavenderDeep}原页~#1}}

\newcommand{\bookend}{\hfill\raisebox{0.15ex}{\rule{0.55em}{0.55em}}}
