\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilshw}[2022/07/01 My experimental homework assignment class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[oneside]{article}


\RequirePackage[OT1]{fontenc}
\RequirePackage[vvarbb, amsthm, theoremfont]{newtx}

\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{microtype}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{subcaption}
\RequirePackage[centering]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[explicit]{titlesec}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{fancyvrb}
\RequirePackage[makeroom]{cancel}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\fancyhead[L]{\@title}
\setlength{\headheight}{15pt}

\fancypagestyle{title}{%
    \fancyhf{}%
    \fancyhead[L]{\thecoursename}
    \fancyhead[R]{\@author}
}

\newcommand{\case}[1]{\vspace{1ex}\noindent\textbf{Case #1.}}

\renewcommand{\maketitle}{%
    \thispagestyle{title}
    {\LARGE\bfseries \@title}
    \vspace{5ex}
}

\newcommand{\thecoursename}{}
\newcommand{\coursename}[1]{\renewcommand{\thecoursename}{#1}}

\usetikzlibrary{calc, through, backgrounds, intersections, cd, perspective, 3d}
\tikzstyle{rpath}=[rounded corners=0.1pt]
\tikzstyle{dot}=[draw, shape=circle, fill=black, inner sep=0pt, minimum size=2pt]
\pgfplotsset{width=7cm,compat=newest}
\hypersetup{colorlinks=true, linkcolor=black, citecolor=black, urlcolor=aaltoBlue}

\newtheoremstyle{solution}%
    {\topsep}%
    {2em}%
    {}%
    {}%
    {\itshape}%
    {.}%
    {.5em}%
    {}

\theoremstyle{definition}
\newtheorem{exercise}{Exercise}

\theoremstyle{solution}
\newtheorem*{solution}{Solution}

\allowdisplaybreaks
