\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bellabook}[2026/09/10 BellaBook faithful French-Chinese edition]
\LoadClass[11pt,twoside,openany]{book}
\RequirePackage[paperwidth=7.5in,paperheight=10in,inner=21mm,outer=18mm,top=20mm,bottom=22mm,headheight=15pt,headsep=7mm,footskip=11mm]{geometry}
\RequirePackage{fontspec,xeCJK}
\setmainfont[Path=vendor/fonts/,Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyretermes}
\setsansfont[Path=vendor/fonts/,Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyreheros}
\setmonofont[Path=vendor/fonts/,Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyrecursor}
\setCJKmainfont[Path=vendor/fonts/,BoldFont=NotoSerifCJKsc-Bold.otf,ItalicFont=NotoSerifCJKsc-Regular.otf,BoldItalicFont=NotoSerifCJKsc-Bold.otf]{NotoSerifCJKsc-Regular.otf}
\setCJKsansfont[Path=vendor/fonts/,BoldFont=NotoSansCJKsc-Bold.otf,ItalicFont=NotoSansCJKsc-Regular.otf,BoldItalicFont=NotoSansCJKsc-Bold.otf]{NotoSansCJKsc-Regular.otf}
\setCJKmonofont[Path=vendor/fonts/]{NotoSansCJKsc-Regular.otf}
\xeCJKDeclareCharClass{Default}{"2018 -> "2019}
\RequirePackage[french]{babel}
\frenchsetup{AutoSpacePunctuation=true}
\RequirePackage{amsmath,amssymb,booktabs,longtable,tabularx,array,graphicx,microtype,enumitem}
\RequirePackage{newunicodechar}
\newfontfamily\CircleFont[Path=vendor/fonts/]{NotoSansCJKsc-Regular.otf}
\newfontfamily\IPAFont[Path=vendor/fonts/,BoldFont=CharisSIL-Bold.ttf,ItalicFont=CharisSIL-Italic.ttf,BoldItalicFont=CharisSIL-BoldItalic.ttf]{CharisSIL-Regular.ttf}
\newunicodechar{Ⅰ}{{\CircleFont Ⅰ}}
\newunicodechar{Ⅱ}{{\CircleFont Ⅱ}}
\newunicodechar{Ⅲ}{{\CircleFont Ⅲ}}
\newunicodechar{Ⅳ}{{\CircleFont Ⅳ}}
\newunicodechar{①}{{\CircleFont ①}}
\newunicodechar{②}{{\CircleFont ②}}
\newunicodechar{③}{{\CircleFont ③}}
\newunicodechar{④}{{\CircleFont ④}}
\newunicodechar{⑤}{{\CircleFont ⑤}}
\newunicodechar{⑥}{{\CircleFont ⑥}}
\newunicodechar{⑦}{{\CircleFont ⑦}}
\newunicodechar{ˈ}{{\IPAFont ˈ}}
\newunicodechar{ɔ}{{\IPAFont ɔ}}
\newunicodechar{ː}{{\IPAFont ː}}
\newunicodechar{ɪ}{{\IPAFont ɪ}}
\newunicodechar{ɡ}{{\IPAFont ɡ}}
\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz,titlesec,fancyhdr,emptypage,etoolbox,ragged2e,setspace,changepage,needspace,xparse}
\usetikzlibrary{calc}
\RequirePackage{hyperref,bookmark}
\RequirePackage{colortbl}
\definecolor{BellaBlue}{HTML}{3C71B7}
\definecolor{BellaTeal}{HTML}{159A9C}
\definecolor{BellaInk}{HTML}{24313F}
\definecolor{BellaPale}{HTML}{F3F7FA}
\definecolor{BellaGray}{HTML}{6C7884}
\hypersetup{unicode=true,colorlinks=true,linkcolor=BellaBlue,urlcolor=BellaTeal,citecolor=BellaTeal,bookmarksopen=true,bookmarksnumbered=true,pdftitle={语言学导论：从柏拉图到乔姆斯基},pdfauthor={Lionel Spinosa},pdfsubject={Fidèle transcription du fac-similé; notes de collation distinctes}}
\setlength{\parindent}{1.5em}
\setlength{\parskip}{0.35em}
\setstretch{1.12}
\emergencystretch=2em
\raggedbottom
\let\cleardoublepage\clearpage
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}
\setlist{topsep=0.4em,itemsep=0.3em,parsep=0.2em,leftmargin=1.65em}
\setlist[itemize,1]{label=\textcolor{BellaTeal}{$\diamond$}}
\renewcommand{\thesection}{\Roman{section}.}
\renewcommand{\thesubsection}{\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
\titleformat{\chapter}[display]{\normalfont\bfseries\color{BellaInk}}{\filleft\sffamily\color{BellaBlue}\fontsize{13}{16}\selectfont CHAPITRE~\thechapter}{1ex}{\filleft\fontsize{29}{33}\selectfont}[\vspace{1.2ex}\titlerule]
\titlespacing*{\chapter}{0pt}{-4pt}{23pt}
\titleformat{\section}{\Large\bfseries\color{BellaInk}}{\textcolor{BellaBlue}{\thesection}}{0.6em}{}
\titleformat{\subsection}{\large\bfseries\color{BellaBlue}}{\thesubsection}{0.6em}{}
\titleformat{\subsubsection}{\normalsize\bfseries\color{BellaInk}}{\thesubsubsection}{0.6em}{}
\titlespacing*{\section}{0pt}{2ex plus .6ex}{.8ex}
\titlespacing*{\subsection}{0pt}{1.6ex plus .5ex}{.5ex}
\pagestyle{fancy}\fancyhf{}
\fancyhead[LE]{\small\sffamily\color{BellaGray}Sciences du langage}
\fancyhead[RO]{\small\sffamily\color{BellaGray}\nouppercase{\rightmark}}
\fancyfoot[LE,RO]{\sffamily\color{BellaBlue}\thepage}
\fancyfoot[RE,LO]{}
\renewcommand{\headrulewidth}{.3pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancypagestyle{plain}{\fancyhf{}\fancyfoot[LE,RO]{\sffamily\color{BellaBlue}\thepage}\renewcommand{\headrulewidth}{0pt}}
\newtcolorbox{keybox}[1][]{enhanced,breakable,colback=white,colframe=BellaTeal,boxrule=.55pt,arc=1.2mm,left=3mm,right=3mm,top=2mm,bottom=2mm,title=#1,fonttitle=\sffamily\bfseries,colbacktitle=BellaTeal}
\newcommand{\frontchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}\markboth{#1}{#1}}
\newcommand{\origpage}[2]{\par\hypertarget{src-#1}{}\label{src-#1}\ignorespaces}
\newcommand{\origcont}[2]{\unskip\space\hypertarget{src-#1}{}\label{src-#1}\ignorespaces}
\newcounter{editorialnote}
\newcommand{\ednote}[1]{\stepcounter{editorialnote}\begingroup\renewcommand{\thefootnote}{校\arabic{editorialnote}}\footnote{\normalfont #1}\endgroup}
\newcommand{\origfoot}[2]{\begingroup\renewcommand{\thefootnote}{原#1}\footnote{\normalfont #2}\endgroup}
\newcommand{\lecturetitle}[1]{\par\addvspace{1em}\Needspace{4\baselineskip}\noindent{\color{BellaTeal}\rule{9mm}{.6pt}}\enspace{\bfseries\color{BellaInk}#1}\par\nobreak\vspace{.25em}}
\newenvironment{lecture}[1]{\lecturetitle{#1}\begin{adjustwidth}{4mm}{4mm}\small\itshape\setlength{\parindent}{0pt}}{\par\end{adjustwidth}\vspace{.3em}}
\newenvironment{bbcomplement}[1]{\lecturetitle{Lecture Complémentaire}\begin{adjustwidth}{4mm}{4mm}\small\setlength{\parindent}{0pt}\begin{center}\bfseries #1\end{center}}{\par\end{adjustwidth}\vspace{.5em}}
\newcommand{\minititle}[1]{\par\Needspace{3\baselineskip}\noindent\textbf{#1}\par\nobreak}
\NewDocumentCommand{\gloss}{m m g}{\par\Needspace{4\baselineskip}\noindent\IfNoValueTF{#3}{\textbf{#1}\par\nobreak #2\par}{\textbf{#1\quad #2}\par\nobreak #3\par}}
\newcommand{\ecite}[1]{\hyperref[ref-#1]{[E#1]}}
\renewcommand{\footnoterule}{\kern-3pt\hrule width .27\columnwidth\kern2.6pt}
\setlength{\skip\footins}{13pt plus 3pt minus 2pt}
\interfootnotelinepenalty=10000
\clubpenalty=3000\widowpenalty=3000
