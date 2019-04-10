@echo off

call cd ../

if exist .vimrc (
  echo F | xcopy /Y /D /R .vimrc ..\_vimrc
)

if exist .gvimrc (
  echo F | xcopy /Y /D /R .gvimrc ..\_gvimrc
)

if exist .deinrc (
  call xcopy /Y /D /R /I .deinrc ..\.deinrc
)

exit