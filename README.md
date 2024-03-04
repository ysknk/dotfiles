# dotfiles

## Description

Setup for Vim, iTerm(zsh).

## Required

### For All

- check command
    - `git -v`
    - `make -v`

### For Windows

1. [Chocolatey](https://chocolatey.org/install)
    - `choco -v`
1. [MSYS2](http://www.msys2.org/)
1. [gnuwin32](http://gnuwin32.sourceforge.net/packages/make.htm)

- check command
    - `sed --version`
    - `cygpath --version`
    - `echo %HOME%` -> Environment variables must be set(ex: C:\Users\ysknk)

## Recommended

### Font
[Cica](https://github.com/miiton/Cica)

## How to Setup

1. Required Install

1. **Clone**
    ```
    git clone https://github.com/ysknk/dotfiles.git ~/dotfiles
    ```
1. **You can easily install it using *Makefile***
    ```
    cd ~/dotfiles && make deploy
    ```
1. OS unique settings *optional　& manual
    - mouse sense
    - touch screen
    - sound off
