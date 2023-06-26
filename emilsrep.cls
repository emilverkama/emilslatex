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
\LoadClass[notitlepage]{report}


% Packages
% --------------------------------------------------------------------

% Page geometry
% \RequirePackage[centering]{geometry}

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