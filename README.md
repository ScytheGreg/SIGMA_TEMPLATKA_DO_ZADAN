# 📘 Klasa LaTeX: `sinol.cls`

Klasa `sinol.cls` została stworzona do przygotowywania **kart zadań** w stylu „SINOL” — czytelnych, poziomych arkuszy zawierających **dwie kolumny A5**, z ozdobnymi liniami ASCII i przejrzystym nagłówkiem.

---

## ✨ Funkcjonalność

* Układ poziomy (A4 landscape) z **dwiema kolumnami** w orientacji pionowej (A5 obok siebie).
* Wygodne **zmienne konfiguracyjne**: autor, przedmiot, numer serii i zadania.
* Estetyczne **ramki ASCII** wokół treści zadań (`%`, `*`, itp.).
* Sekcja **„Rozwiązanie”** w mniejszej czcionce, z liniami ASCII powyżej i poniżej.
* Możliwość **globalnej zmiany znaków linii** (np. `=`, `#`, `-`).
* Stabilne łamanie stron i kolumn — ramki i podpisy nie rozpadają się przy podziale.
* Obsługa **języka polskiego** i opcjonalnie angielskiego (przez `babel`).
* Wbudowana konfiguracja `geometry`, `fancyhdr` i `multicol`.

---

## 🧱 Struktura repozytorium

```
sinol/
│
├── sinol.cls         # Główna klasa LaTeX
├── main.tex          # Przykładowy plik pokazujący użycie
└── README.md         # Ten plik
```

---

## ⚙️ Instalacja

1. Skopiuj plik `sinol.cls` do folderu, w którym tworzysz swój dokument `.tex`.

2. W preambule użyj:

   ```latex
   \documentclass{sinol}
   ```

3. Kompiluj za pomocą **XeLaTeX** lub **pdfLaTeX** (obsługa UTF-8 jest domyślna).

---

## 🧩 Przykładowe użycie

```latex
\documentclass{sinol}

% Dane do nagłówka
\ustawAutor{Jan Kowalski}
\ustawPrzedmiot{Matematyka dyskretna}
\ustawSeria{3}
\ustawNrZadania{5, 6}

% Ustawienia znaków ASCII
\ustawZnakNaglowka{=}
\ustawZnakRamki{*}
\ustawZnakRozwiazania{-}

\begin{document}
\begin{multicols}{2}

\begin{zadanie}
5. Udowodnij, że jeśli graf $G$ jest dwudzielny, to nie zawiera cykli o nieparzystej długości.
\end{zadanie}

\begin{rozwiazanie}
Graf dwudzielny można pokolorować dwoma kolorami, tak że każda krawędź łączy wierzchołki o różnych kolorach.
\end{rozwiazanie}

\begin{zadanie}
6. Policz liczbę permutacji zbioru $\{1,2,3,4,5\}$, w których żaden element nie stoi na swoim miejscu.
\end{zadanie}

\begin{rozwiazanie}
Liczba derangementów $!5 = 44$.
\end{rozwiazanie}

\end{multicols}
\end{document}
```

---

## 🔤 Zmienne nagłówka

| Komenda                    | Opis                   |
| -------------------------- | ---------------------- |
| `\ustawAutor{<tekst>}`     | Ustawia autora arkusza |
| `\ustawPrzedmiot{<tekst>}` | Nazwa przedmiotu       |
| `\ustawSeria{<numer>}`     | Numer serii            |
| `\ustawNrZadania{<numer>}` | Numer lub zakres zadań |

---

## 💠 Zmienne stylu ASCII

| Komenda                         | Opis                                             |
| ------------------------------- | ------------------------------------------------ |
| `\ustawZnakNaglowka{<znak>}`    | Znak linii w nagłówku (np. `=` lub `#`)          |
| `\ustawZnakRamki{<znak>}`       | Znak obramowania zadań (np. `%`, `*`)            |
| `\ustawZnakRozwiazania{<znak>}` | Znak linii nad i pod rozwiązaniem (np. `-`, `_`) |

---

## 📐 Układ i proporcje

* Marginesy: `1.5cm` z każdej strony
* Odstęp między kolumnami: `1cm`
* Ramki i linie mają regulowaną szerokość przez zmienną `\sinolboxwidth` (domyślnie `\textwidth`).

---

## 📚 Wymagane pakiety

W klasie `sinol.cls` są automatycznie załadowane m.in.:

* `geometry` – zarządzanie marginesami
* `fancyhdr` – nagłówki i stopki
* `multicol` – układ wielokolumnowy
* `lmodern`, `fontenc`, `inputenc` – czcionki i kodowanie
* `babel` – język polski (i opcjonalnie angielski)
* `needspace` – kontrola łamania stron
* `blindtext` – tekst przykładowy
* `amsmath`, `amssymb`, `amsthm` – rozszerzenia matematyczne
* `mathtools`, `bm`, `physics`, `siunitx` – dodatkowe symbole, makra i jednostki SI

---

## 💬 Dobre praktyki

* Kompiluj zawsze dwukrotnie, aby `multicol` i `fancyhdr` poprawnie obliczyły układ.
* Unikaj ręcznych podziałów stron (`\newpage`) — klasa dba o spójność ramek.
* Dla pełnej zgodności językowej:

  ```latex
  \RequirePackage[polish,english]{babel}
  ```

  umożliwi pisanie fragmentów po angielsku.

---

## 🧠 Autor

**Projekt SINOL LaTeX**
Autor: *ScytheGreg*
Licencja: MIT (można dowolnie modyfikować i używać w pracach dydaktycznych)

---

> 💡 Wersja: 2025-11-06
> Klasa przetestowana na: TeX Live 2024 / MiKTeX 24.3

---

## 🇬🇧 English Summary

The `sinol.cls` class provides a clean, horizontally oriented **A4 LaTeX layout** for creating **two A5-sized problem sheets** side by side.
It includes ASCII-style headers and borders, configurable metadata (author, subject, task series), and math-ready environments for problem statements and solutions.
All visual elements — including borders and header rules — can be customized using single-character patterns (`=`, `#`, `%`, etc.).
The class is fully compatible with Polish and English languages via `babel`, and is ideal for academic exercise sheets or competitions.
