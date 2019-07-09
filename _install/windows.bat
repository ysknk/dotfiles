@echo off
chcp 65001
setlocal enabledelayedexpansion
REM cd %~dp0

REM a2b symbolic link file [ mklink ..\b a ]
REM a2b symbolic link directory [ mklink /d ..\b a ]

set DOTFILES_DIR=%HOME%\dotfiles\
set NVIM_DIR=%HOME%\AppData\Local\nvim

cd %DOTFILES_DIR%

REM nvim
if not exist %NVIM_DIR% (
  mkdir %NVIM_DIR%
)
REM dirs
for /d %%f in (.??*) do (
  rmdir "%HOME%\%%f"
  mklink /d "%HOME%\%%f" "%DOTFILES_DIR%%%f"
)

REM files
for %%f in (.??*) do (
  set filename=%%f
  if "%%f" == ".gvimrc" (
    del "%HOME%\!filename:.=_!"
    mklink "%HOME%\!filename:.=_!" "%DOTFILES_DIR%%%f"
    mklink "%NVIM_DIR%\ginit.vim" "%DOTFILES_DIR%%%f"

  ) else if "%%f" == ".vimrc" (
    del "%HOME%\!filename:.=_!"
    mklink "%HOME%\!filename:.=_!" "%DOTFILES_DIR%%%f"
    mklink "%NVIM_DIR%\init.vim" "%DOTFILES_DIR%%%f"

  ) else (
    if not "%%f" == ".git" (
    if not "%%f" == ".gitignore" (
      del "%HOME%\%%f"
      mklink "%HOME%\%%f" "%DOTFILES_DIR%%%f"
    )
    )
  )
)

echo [32mDeploy dotfiles complete!.[0m

