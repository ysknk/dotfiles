# dotfiles

## Description

Setup for Vim, iTerm(zsh).

## Required

### For All

1. Git

### For Windows

1. [Chocolatey](https://chocolatey.org/install)
    - `choco -v`
1. [MSYS2](http://www.msys2.org/)
1. [gnuwin32](http://gnuwin32.sourceforge.net/packages/make.htm)

- check command
    - `make -v`
    - `sed --version`
    - `cygpath --version`
    - `echo %HOME%` -> Environment variables must be set(ex: C:\Users\ysknk)

## Recommended

### Font
[RictyDiminishedDiscord](https://github.com/edihbrandon/RictyDiminished)

## How to Setup

1. Required Install

1. **Clone**
    ```
    git clone https://github.com/ysknk/dotfiles.git ~/dotfiles
    ```
1. **You can easily install it using *Makefile***
    ```
    cd ~/dotfiles
    make deploy
    ```

