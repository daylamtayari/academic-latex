\NeedsTexFormat{LaTeX2e}
\ProvidesClass{academic}{2022/08/25 Class file for academic use.}

\LoadClassWithOptions{article}


% ----- Options -----
\newcommand\@optitlepage{0}
\DeclareOption{titlepage}{\renewcommand\@optitlepage{1}}


% ----- Variables -----
% \acclass  - Class name
% \acname   - Name
% \acid     - ID or email
% \acassign - Assignment name
% \acdate   - Due date


% ----- Packages -----

% Ensure UTF-8 characters are all present.
\RequirePackage[utf8]{fontenc}              % Characters

% Page Setup
\RequirePackage{geometry}                   % Page sizing
\RequirePackage{fancyhdr}                   % Page layout

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
\RequirePackage{tabulararray}               % Tables
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
\RequirePackage{tikz}

% Colors and beautification
\RequirePackage{xcolor}                     % Fancy colours
\RequirePackage[colorlinks=true]{hyperref}  % Link handling

% Conditionals
\RequirePackage{ifthen}                     % Conditionals


% ----- Page Setup -----
\geometry{letterpaper, left=1in, top=1in, right=1in, bottom=1in}
\doublespacing
\pagestyle{fancy}


% ----- Header and Footer Setup -----
\fancyhf{}
\lhead{\acclass{}}
\chead{\acassign{}}
\rhead{\acname{}}
\cfoot{\thepage}
