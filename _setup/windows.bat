@echo off
chcp 65001
setlocal enabledelayedexpansion

set DOTFILES_DIR=%HOME%\dotfiles
set NVIM_DIR=%LOCALAPPDATA%\nvim

cd %DOTFILES_DIR%

:
: Deploy files and dirs
:

REM Deploy nvim dir
if not exist %NVIM_DIR% (
  mkdir %NVIM_DIR%
)

REM Deploy files
for %%f in (.??*) do (
  set filename=%%f
  if "%%f" == ".gvimrc" (
    del "%HOME%\!filename:.=_!"
    mklink "%HOME%\!filename:.=_!" "%DOTFILES_DIR%\%%f"
    del "%NVIM_DIR%\ginit.vim"
    mklink "%NVIM_DIR%\ginit.vim" "%DOTFILES_DIR%\%%f"
  ) else if "%%f" == ".vimrc" (
    del "%HOME%\!filename:.=_!"
    mklink "%HOME%\!filename:.=_!" "%DOTFILES_DIR%\%%f"
    del "%NVIM_DIR%\init.vim"
    mklink "%NVIM_DIR%\init.vim" "%DOTFILES_DIR%\%%f"
  ) else (
    if not "%%f" == ".git" (
    if not "%%f" == ".gitignore" (
    if not "%%f" == ".gitmodules" (
    if not "%%f" == "Thumbs.db" (
    if not "%%f" == ".travis.yml" (
      del "%HOME%\%%f"
      mklink "%HOME%\%%f" "%DOTFILES_DIR%\%%f"
    )))))
  )
)
REM Deploy dirs
for /d %%f in (.??*) do (
  rmdir "%HOME%\%%f"
  mklink /d "%HOME%\%%f" "%DOTFILES_DIR%\%%f"
)

echo [32mDeploy dotfiles complete!.[0m
:
: End Deploy
:

