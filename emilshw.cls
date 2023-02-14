\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emilshw}[2022/07/01 Emil's homework class]


% Options
% --------------------------------------------------------------------

% We extend my article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{emilsart}}
\ProcessOptions\relax
\LoadClass{emilsart}

% Setup
% --------------------------------------------------------------------

% Command for storing the name of the course
\newcommand{\@coursename}{}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}

% Adds coursename to footnote
\let\old@title\title
\renewcommand{\title}[1]{\old@title{#1\thanks{\@coursename}}}

% Formating section titles
\titleformat{\section}{\large}{{\bfseries Problem \thesection}}{1em}{}

% Style for solution environment
\newtheoremstyle{solution}%
  {\topsep}%
  {2em}%
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