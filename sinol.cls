% ============================================
%  sinol.cls — klasa LaTeX dla kart zadań
%  Autor: [opcjonalnie wpisz swoje nazwisko]
%  Wersja: 2025-11-06
%  Opis:
%    Klasa dokumentu do generowania kart zadań SINOL.
%    Układ poziomy (A4 landscape) z dwiema kolumnami A5.
%    Ramki ASCII oraz konfigurowalne znaki graficzne.
% ============================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sinol}[2025/11/06 Klasa do kart zadań SINOL]

% ============================================
% 1. BAZOWA KLASA DOKUMENTU
% ============================================
\LoadClass[a4paper,12pt,landscape]{article}

% ============================================
% 2. PAKIETY OGÓLNE
% ============================================
\RequirePackage[utf8]{inputenc}   % Kodowanie wejścia UTF-8
\RequirePackage[T1]{fontenc}      % Polski alfabet w T1
\RequirePackage[polish,english]{babel} % Ustawienia językowe PL i EN
\RequirePackage{geometry}         % Ustawienia marginesów
\RequirePackage{fancyhdr}         % Nagłówki i stopki
\RequirePackage{multicol}         % Dwie kolumny (A5 obok siebie)
\RequirePackage{lmodern}          % Lepsze fonty wektorowe
\RequirePackage{titlesec}         % Drobne modyfikacje sekcji
\RequirePackage{titling}          % Dodatkowe polecenia tytułowe
\RequirePackage{etoolbox}         % Rozszerzone makra
\RequirePackage{blindtext}        % Tekst przykładowy
\RequirePackage{needspace}        % Kontrola miejsca przed elementami

% ============================================
% 2.1. PAKIETY MATEMATYCZNE
% ============================================
\RequirePackage{amsmath}     % środowiska align, gather, split
\RequirePackage{amssymb}     % dodatkowe symbole (ℝ, ∅, itp.)
\RequirePackage{amsfonts}    % fonty mathbb, mathfrak
\RequirePackage{mathtools}   % ulepszenia amsmath (\coloneqq)
\RequirePackage{amsthm}      % twierdzenia i definicje
\RequirePackage{bm}          % pogrubione symbole matematyczne
\RequirePackage{siunitx}     % jednostki (\SI)
\RequirePackage{cancel}      % przekreślanie wyrażeń
\RequirePackage{esint}       % rozszerzony zestaw całek
\RequirePackage{nicefrac}    % ułamki w linii (\nicefrac)
\RequirePackage{commath}     % normy, pochodne itp.
\RequirePackage{mathrsfs}    % ozdobne litery (\mathscr)
\RequirePackage{dsfont}      % podwójna jedynka (\mathds{1})
\RequirePackage{array}       % rozszerzone tabele
\RequirePackage{cases}       % środowisko cases
\RequirePackage{xfrac}       % ułamki skośne (\sfrac)
\RequirePackage{relsize}     % zmiana rozmiaru symboli (\mathlarger)

% ============================================
% 3. UKŁAD STRONY I KOLUMN
% ============================================
\geometry{
  top=1.5cm,
  bottom=1.5cm,
  left=1.5cm,
  right=1.5cm,
  includehead
}

\setlength{\columnsep}{1cm}       % Odstęp między kolumnami
\setlength{\columnseprule}{0.3pt} % Cienka linia rozdzielająca

% ============================================
% 4. ZMIENNE UŻYTKOWNIKA (NAGŁÓWEK)
% ============================================
\newcommand{\Autor}{}       
\newcommand{\Przedmiot}{}   
\newcommand{\Seria}{}       
\newcommand{\NrZadania}{}   

\newcommand{\ustawAutor}[1]{\renewcommand{\Autor}{#1}}
\newcommand{\ustawPrzedmiot}[1]{\renewcommand{\Przedmiot}{#1}}
\newcommand{\ustawSeria}[1]{\renewcommand{\Seria}{#1}}
\newcommand{\ustawNrZadania}[1]{\renewcommand{\NrZadania}{#1}}

% ============================================
% 5. GLOBALNE ZNAKI ASCII DO DEKORACJI
% ============================================
\newcommand{\ZnakNaglowka}{\#}   % Linia pod nagłówkiem
\newcommand{\ZnakRamki}{\%}      % Ramka zadania
\newcommand{\ZnakRozwiazania}{-} % Linie w sekcji rozwiązania

\newcommand{\ustawZnakNaglowka}[1]{\renewcommand{\ZnakNaglowka}{#1}}
\newcommand{\ustawZnakRamki}[1]{\renewcommand{\ZnakRamki}{#1}}
\newcommand{\ustawZnakRozwiazania}[1]{\renewcommand{\ZnakRozwiazania}{#1}}

% ============================================
% 6. FUNKCJA RYSUJĄCA LINIE ASCII
% ============================================
\newlength{\sinolboxwidth}
\setlength{\sinolboxwidth}{\textwidth}

% \drawline{<znak>}{<długość>} – powtarza znak, aż do długości
\newcommand{\drawline}[2]{%
  \begingroup
    \ttfamily
    \noindent\makebox[#2][l]{%
      \leavevmode\hbox to #2{\leaders\hbox{#1}\hfill}%
    }%
    \par
  \endgroup
}

% ============================================
% 7. NAGŁÓWEK STRONY (fancyhdr)
% ============================================
\pagestyle{fancy}
\fancyhf{}

\fancyhead[L]{\textbf{\Autor}}
\fancyhead[C]{\textbf{\Przedmiot}}
\fancyhead[R]{\textbf{Seria: \Seria, Zad. \NrZadania}}
\renewcommand{\headrulewidth}{0pt}

\makeatletter
\renewcommand{\headrule}{%
  \vspace{0.2em}%
  \drawline{\ZnakNaglowka}{\textwidth}% ASCII linia nagłówka
  \vspace{-0.3em}%
}
\makeatother

% ============================================
% 8. ŚRODOWISKO: ZADANIE
% ============================================
\newenvironment{zadanie}{%
  \par\smallskip
  \begingroup
    \begin{minipage}{\linewidth} % jeden blok — nie łamie się między kolumnami
      \ttfamily
      \drawline{\ZnakRamki}{\linewidth}       % górna linia ramki
      \noindent\ZnakRamki\hspace{0.5em}%
      \begin{minipage}{\dimexpr\linewidth-2em\relax}
        \vspace{0.5em}
}{%
        \vspace{0.5em}
      \end{minipage}%
      \hspace{0.5em}\ZnakRamki\par
      \drawline{\ZnakRamki}{\linewidth}       % dolna linia ramki
    \end{minipage}%
  \endgroup
  \par\smallskip
}

% ============================================
% 9. ŚRODOWISKO: ROZWIĄZANIE
% ============================================
\newenvironment{rozwiazanie}{%
  \par\smallskip
  \clubpenalty=10000
  \widowpenalty=10000
  \displaywidowpenalty=10000
  \small
  \drawline{\ZnakRozwiazania}{\linewidth}
  \textbf{Rozwiązanie.}\par\smallskip
}{%
  \par\nobreak\penalty10000\relax
  \vskip 0pt plus 2\baselineskip
  \drawline{\ZnakRozwiazania}{\linewidth}
  \par\medskip
}

% ============================================
% 10. USTAWIENIA OGÓLNE
% ============================================
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}
\setlength{\headheight}{24pt} % poprawione — zgodne z fancyhdr
\setlength{\footskip}{6pt}    % bez warningów

% ============================================
% 11. KONIEC KLASY
% ============================================
\endinput
