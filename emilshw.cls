\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilshw}[2023/02/14 Emil's homework class]


% Options
% --------------------------------------------------------------------

\newif\if@nosol
\@nosolfalse

% Choose not to show solutions
\DeclareOption{nosol}{\@nosoltrue}

% We extend my article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{emilsart}}
\ProcessOptions\relax
\LoadClass{emilsart}


% Packages
% --------------------------------------------------------------------

% Bad solution for nicer verbatim
\RequirePackage{fancyvrb}

% Bad solution for hiding solutions (breaks synctex)
\RequirePackage{version}


% Setup
% --------------------------------------------------------------------

% Command for storing the name of the course
\newcommand{\@coursename}{}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}

% Title format
\setlength{\headheight}{15pt}

\fancypagestyle{title}{%
    \fancyhf{}%
    \fancyhead[L]{\@author}
    \fancyhead[R]{\@coursename}
    \fancyfoot[C]{\thepage}
}

\renewcommand{\maketitle}{
  \thispagestyle{title}
  \begin{center}
    {\Large\MakeUppercase{\@title}} \\[0.5em]
    \@date \\[2.5em]
  \end{center}
}

% Formating section titles
\titleformat{\section}{\large}{{\bfseries Problem \thesection}}{1em}{}

% Style for the exercise environment
\newtheoremstyle{exercise}%
  {\topsep}%
  {\topsep}%
  {}%
  {}%
  {\bfseries}%
  {.}%
  {.5em}%
  {}

% Style for solution environment
\newtheoremstyle{solution}%
  {\topsep}%
  {.5em}%
  {}%
  {}%
  {\itshape}%
  {.}%
  {0.5em}%
  {}

% Defining the exercise and solution environments
\theoremstyle{exercise}
\newtheorem{exercise}{Exercise}
\theoremstyle{solution}
\newtheorem*{solution}{Solution}

\if@nosol
  \excludeversion{solution}
  \excludeversion{proof}
\fi