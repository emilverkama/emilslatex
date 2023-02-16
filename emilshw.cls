\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilshw}[2023/02/14 Emil's homework class]


% Options
% --------------------------------------------------------------------

% We extend my article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{emilsart}}
\ProcessOptions\relax
\LoadClass{emilsart}


% Packages
% --------------------------------------------------------------------

% Subpar solution for nicer verbatim
\RequirePackage{fancyvrb}


% Setup
% --------------------------------------------------------------------

% Command for storing the name of the course
\newcommand{\@coursename}{}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}

% Title format
\setlength{\headheight}{15pt}

\fancypagestyle{title}{%
    \fancyhf{}%
    \fancyhead[L]{\@coursename}
    \fancyhead[R]{\@date}
    \fancyfoot[C]{\thepage}
}

\renewcommand{\maketitle}{
  \thispagestyle{title}
  {\Large\bfseries\@title} \\[0.5em]
  \@author
}

% Formating section titles
\titleformat{\section}{\large}{{\bfseries Problem \thesection}}{1em}{}

% Style for solution environment
\newtheoremstyle{solution}%
  {\topsep}%
  {.5em}%
  {}%
  {}%
  {\itshape}%
  {.}%
  {.5em}%
  {}

% Defining the exercise and solution environments
\theoremstyle{plain}
\newtheorem*{exercise}{Exercise}
\theoremstyle{solution}
\newtheorem*{solution}{Solution}