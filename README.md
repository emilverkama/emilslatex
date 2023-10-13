# Emil's LaTeX

This repository contains my personal classes, packages and snippets for LaTeX, namely:
- `emilspack.sty`: loads often-used packages for mathematical typesetting and defines some relatively conservative macros
- `kthlogo.sty`: package implementing the KTH logo, colors and line patterns
- `emilsart.cls`: extension of the base article class
- `emilsrep.cls`: extension of the base report class
- `emilshw.cls`: extension of `emilsart.cls`, specifically meant for homework sheets and solutions
- `beamerthemeemil.cls`: nice and simple beamer template
- `beamerthemekth.cls`: extension of `beamerthemeemil.cls` implementing a KTH-compliant theme
- `latex.json`: snippets to be used with VSCode.

As per the ideological guidelines of [Okko Makkonen](https://okkomakkonen.fi), the point is to make LaTeX code both faster to write and easier to read.

## Installation
Copy the `.sty` and `.cls` files along with the logo folder to `$TEXMFHOME/tex/latex/local/`, and the `latex.json` file to e.g. `$HOME/.config/Code/User/snippets/`.

Alternatively you can place the `.sty` and `.cls` files in your working directory, this works also in Overleaf. 
Note that `emilshw.cls` depends on `emilsart.cls` which depends on `emilspack.sty`, so this might be inconvenient.

## Future
Everything here is subject to change. Backwards compatability will likely be broken very often.
