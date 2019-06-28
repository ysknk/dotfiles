@echo off

call cd ../

if exist .vimrc (
  echo F | xcopy /Y /D /R .vimrc ..\_vimrc
)

if exist .gvimrc (
  echo F | xcopy /Y /D /R .gvimrc ..\_gvimrc
)

if exist .vimrc (
  echo F | xcopy /Y /D /R .vimrc ..\AppData\Local\nvim\init.vim
)

if exist .gvimrc (
  echo F | xcopy /Y /D /R .gvimrc ..\AppData\Local\nvim\ginit.vim
)

if exist .deinrc (
  call xcopy /Y /D /R /I .deinrc ..\.deinrc
)

exit
