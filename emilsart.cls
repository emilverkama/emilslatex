\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilsart}[2023/02/14 Emil's customized article class]


% Options
% --------------------------------------------------------------------

\newif\if@nocm
\@nocmtrue

\newif\if@tikz
\@tikzfalse

% With the cm option set, no fancy fonts are loaded
\DeclareOption{cm}{\@nocmfalse}

% Choose whether to load tikz, which might slow down compilation
\DeclareOption{tikz}{\@tikztrue}

% Default options to be passed to the article class
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{a4paper, 12pt}

% Pass undeclared options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Load the article class
\ProcessOptions\relax
\LoadClass{article}


% Packages
% --------------------------------------------------------------------

% Page geometry
\RequirePackage[centering]{geometry}

% Set font encoding, load fonts
\RequirePackage[T1]{fontenc}

\if@nocm
  \RequirePackage[vvarbb, amsthm, theoremfont]{newtx}
\else
  \RequirePackage{lmodern}
\fi

% Formatting for headers, footers and titles
\RequirePackage{fancyhdr}
\RequirePackage[small]{titlesec}

% Nice figures
\RequirePackage{subcaption}

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

% Document title formatting
\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
  \let \footnote \thanks
    {\Huge \@title} \\[2em]
    {\large \@author} \\[1em]
    \@date
  \end{center}%
  \par
  \vskip 3em}


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