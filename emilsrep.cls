\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilsrep}[2023/02/14 Emil's customized report class]


% Options
% --------------------------------------------------------------------

\newif\if@nocm
\@nocmtrue

\newif\if@tikz
\@tikzfalse

% Choose not to load fancy fonts
\DeclareOption{cm}{\@nocmfalse}

% Choose whether to load tikz (might slow down compilation)
\DeclareOption{tikz}{\@tikztrue}

% Pass undeclared options to the report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Load the report class
\ProcessOptions\relax
\LoadClass[notitlepage, twoside]{report}


% Packages
% --------------------------------------------------------------------

% Page geometry
\RequirePackage[hscale=0.7, vscale=0.8, top=25mm, hcentering, headsep=5mm]{geometry}

% Set font encoding, load fonts
\RequirePackage[T1]{fontenc}

\if@nocm
  \RequirePackage[vvarbb, amsthm, theoremfont]{newtx}
\else
  \RequirePackage{lmodern}
\fi

% Formatting for headers, footers and titles
\RequirePackage{fancyhdr}
\RequirePackage[center, tiny]{titlesec}

% Nice figures
\if@tikz
  \RequirePackage{tikz}
  \RequirePackage{pgfplots}
\fi

% Nicer tables
\RequirePackage{booktabs}

% Skips instead of indents at new paragraphs
\RequirePackage{parskip}

% Load my macro package
\if@nocm
  \RequirePackage[noamssymb]{emilspack}
\else
  \RequirePackage{emilspack}
\fi


% Setup
% --------------------------------------------------------------------

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\fancyhf{}
\fancyhead[CE]{\textit{\leftmark}}
\fancyhead[CO]{\textit{\rightmark}}
\fancyhead[LE,RO]{\thepage}
\setlength{\headheight}{15pt}
\renewcommand{\headrulewidth}{0pt}


% Document title formatting
\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
  \let \footnote \thanks
    {\Large\MakeUppercase{\@title} \\}\vskip 2em
    {\@author \\}\vskip 0.3em
    \@date \\[4em]
  \end{center}}

% Abstract formatting
\renewenvironment{abstract}{
  \begin{center}
    \textbf{Abstract}
  \end{center}}{}

% Chapter title formatting
\titleformat{\chapter}[block]
  {\centering\Large}{\bfseries\thechapter\\[1em]}{0em}{}

% Tikz: libraries and some useful macros
\if@tikz
  \usetikzlibrary{calc, through, backgrounds, intersections, cd, perspective, 3d}
  \tikzstyle{rpath}=[rounded corners=0.1pt]
  \tikzstyle{dot}=[draw, shape=circle, fill=black, inner sep=0pt, minimum size=2pt]
  \pgfplotsset{width=7cm,compat=newest}

  % Straight barb arrows fit better with newtx
  \if@nocm
    \tikzset{>={Straight Barb[scale=0.8]}}
    \tikzcdset{arrow style=tikz}
  \fi
\fi

% Hyperref setup
\hypersetup{colorlinks=true}

\allowdisplaybreaks