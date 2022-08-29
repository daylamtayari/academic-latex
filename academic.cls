\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{academic}[2022/08/25 Class file for academic use.]



% ----- Options -----
\newcommand\@optitlepage{0}
\DeclareOption{titlepage}{\renewcommand\@optitlepage{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\ProcessOptions

% ----- Variables -----
% \acclass  - Class name
% \acname   - Name
% \acid     - ID or email
% \acassign - Assignment name
% \acdate   - Due date


% ----- Packages -----

% Ensure UTF-8 characters are all present.
\RequirePackage[utf8]{inputenc}              % Characters

% Page Setup
\RequirePackage{geometry}                   % Page sizing
\RequirePackage{fancyhdr}                   % Page layout
\RequirePackage{setspace}                   % Spacing
\RequirePackage{lastpage}                   % Allows the creation of a last page.

% Math and scientific characters
\RequirePackage{amsmath}                    % Math characters and symbols
\RequirePackage{amsfonts}                   % Math characters and symbols
\RequirePackage{amsthm}                     % Math characters and symbols
\RequirePackage{amssymb}                    % Math characters and symbols
\RequirePackage{centernot}                  % Centers not characters
\RequirePackage{siunitx}                    % SI units
\RequirePackage{mathalpha}                  % Math alphabets
\RequirePackage{mathtools}                  % Math characters and symbols
\RequirePackage{steinmetz}                  % Steinmetz notation support

% Tables and Lists
\RequirePackage{tabularray}                 % Tables
\RequirePackage{enumitem}                   % List handlings

% Media Handling
\RequirePackage{graphicx}                   % Graphic media handling
\RequirePackage{listings}                   % Code snippets
\RequirePackage{float}                      % Floating media
\RequirePackage{caption}                    % Captions
\RequirePackage{subcaption}                 % Subcaptions

% Diagrams and Graphs
\RequirePackage[all]{xy}                    % Diagrams
\RequirePackage[siunitx]{circuitikz}        % Circuit diagrams
\RequirePackage{gnuplottex}                 % GNU Plot Graphs
\RequirePackage{tikz}                       % Tikz diagrams

% Colors and beautification
\RequirePackage{xcolor}                     % Fancy colours
\RequirePackage[colorlinks=true]{hyperref}  % Link handling

% Conditionals
\RequirePackage{ifthen}                     % Conditionals
\RequirePackage{suffix}                     % Suffix macros


% ----- Page Setup -----
\geometry{letterpaper, margin=1in}
\doublespacing
\pagestyle{fancy}


% ----- Header and Footer Setup -----
\fancyhf{}
\lhead{\acclass{}}
\chead{\acassign{}}
\rhead{\acname{}}
\cfoot{\thepage}


% ----- Header Setup -----
\ifthenelse{\equal{\@optitlepage}{0}}{
    \renewcommand{\maketitle}[0]{
        \setlength{\headerheight}{15.2pt}
        \setlength{\headsep}{0.2in}
        \renewcommand{\headrulewidth}{0pt}
        \headrule{}
        \thispagestyle{plain}
        \begin{center}
            {\Large \acclass{}}

            {\large \acassign}

            {\acname{}} \\
            {(\acid{})}

            \acdate{}
        \end{center}
        \vspace{0.3in}
        \renewcommand{\headrulewidth}{0.4pt}
    }
}
{
    \renewcommand{\maketitle}[0]{
        \pagestyle{plain}
        \begin{center}
            {\Large \acclass{}}

            {\large \acassign}

            {\acname} \\
            {(\acid{})}

            \acdate{}
        \end{center}
        \renewcommand{\headrulewidth}{0.4pt}
        \newpage
    }
}


% ----- Section Numbering -----
\renewcommand{\theenumi}{\thesection.\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}

% ----- Questions Section -----
% This section is taken directly from https://github.com/jez/latex-homework-class/
% ----- Questions -------------------------------------------------------------
\newcounter{questionCounter}
\newcounter{partCounter}[questionCounter]

% Prefix for questions
\newcommand{\questiontype}[0]{Question}

% Use this if your "written" questions are all under one section
% For example, if the homework handout has Section 5: Written Questions
% and all questions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-question.
\newcommand{\writtensection}[0]{0}

% Numbered question
\providecommand{\question}{}
\renewcommand{\question}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
    \stepcounter{questionCounter}%
      \vspace{2em}%
      \ifx\writtensection\undefined{}
        \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
        \else
          \ifnum\writtensection=0
          \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
          \else
          \noindent{\bf \questiontype\ \writtensection.\arabic{questionCounter}}%
        \fi
      \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
}

% Named question, takes one argument
\WithSuffix\providecommand\question*{}
\WithSuffix\renewcommand\question*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break enywhere in between
  \begin{minipage}{\linewidth}%
    \addtocounter{questionCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{2em}%
    \noindent{\bf \arabic{questionCounter}. #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
}

% ----- Question Parts --------------------------------------------------------

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph{partCounter})}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{questionCounter}.\arabic{partCounter}})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\stepcounter{partCounter}\item}

