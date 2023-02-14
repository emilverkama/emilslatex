# Emil's LaTeX

This repository contains my personal classes, packages and snippets for LaTeX, namely:
- `emilspack.sty`: a package loading often-used packages for mathematical typesetting and defining some relatively conservative macros;
- `emilsart.cls`: my extension of the base article class;
- `emilshw.cls`: an extension of `emilsart.cls`, specifically meant for homework solutions; and
- `latex.json`: snippets to be used with VSCode.
The point is to make LaTeX code easier to both write and read, partly inspired by [Okko Makkonen](https://okkomakkonen.fi).

## Installation
Copy the `.sty` and `.cls` files to `$TEXMFHOME/tex/latex/local/`, and the `latex.json` file to e.g. `$HOME/.config/Code/User/snippets/`.

Alternatively you can place the `.sty` and `.cls` files in your working directory, this works also in Oveleaf. 
Note that `emilshw.cls` depends on `emilsart.cls` which depends on `emilspack.sty`, so this might be inconvenient.

## Future
Everything here is subject to change. Backwards compatability will likely be broken very often.
