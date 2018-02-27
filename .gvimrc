set encoding=utf-8
scriptencoding utf-8

set lines=999 columns=999
set guioptions-=T

" from http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('gui_macvim')
  set guifont=RictyDiminishedDiscord-Regular:h18
  set transparency=20

elseif has("win64") || has("win32unix") || has("win32")
  " メニューの文字化け対策
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim

  set guifont=Ricty\ Diminished\ Discord:h15
  autocmd GUIEnter * set transparency=200
endif
