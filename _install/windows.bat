@echo off
chcp 65001
setlocal enabledelayedexpansion
REM cd %~dp0

REM a2b symbolic link file [ mklink ..\b a ]
REM a2b symbolic link directory [ mklink /d ..\b a ]

set DOTFILES_DIR=%HOME%\dotfiles\
set NVIM_DIR=%HOME%\AppData\Local\nvim\

set VIMRC=%DOTFILES_DIR%.vimrc
set GVIMRC=%DOTFILES_DIR%.gvimrc
set DEIN_DIR=%DOTFILES_DIR%.deinrc

REM vim, gvim
if exist %VIMRC% (
  del "%HOME%\_vimrc"
  mklink "%HOME%\_vimrc" "%VIMRC%"
)
if exist %GVIMRC% (
  del "%HOME%\_gvimrc"
  mklink "%HOME%\_gvimrc" "%GVIMRC%"
)

REM nvim
if not exist %NVIM_DIR% (
  mkdir %NVIM_DIR%
)
if exist %VIMRC% (
  del "%NVIM_DIR%init.vim"
  mklink "%NVIM_DIR%init.vim" "%VIMRC%"
)
if exist %GVIMRC% (
  del "%NVIM_DIR%ginit.vim"
  mklink "%NVIM_DIR%ginit.vim" "%GVIMRC%"
)

REM all
if exist %DEIN_DIR% (
  rmdir "%HOME%\.deinrc"
  mklink /d "%HOME%\.deinrc" "%DEIN_DIR%"
)

exit
