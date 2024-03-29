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

### For Mac

1. XCode
```sh
xcode-select --install
sudo xcode-select --switch /Library/Developer/CommandLineTools
```
2. [Homebrew](https://brew.sh/)
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Homebrew to your PATH
```
3. [oh-my-zsh](https://ohmyz.sh/)
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. For Apple Silicon Mac use Rosetta

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
    - spotlight off & alfred config
