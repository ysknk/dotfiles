" window size
if has('gui_running')
  set lines=999 columns=999
endif

if has('nvim')
  call GuiWindowMaximized(1)
endif

" UIの最小化
if has('gui')
  " ツールバーを非表示
  set guioptions-=T
  " メニューバーを非表示
  set guioptions-=m
  " 垂直スクロールバーを非表示
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  " 水平スクロールバーを非表示
  set guioptions-=b
endif

" from http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" フォント・透過設定等
if has('gui_macvim')
  set guifont=RictyDiminishedDiscord-Regular:h20
  set transparency=20
  ” 自動IME変換をオフに
  set imdisable

elseif has('win64') || has('win32unix') || has('win32')
  " メニューの文字化け対策
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim

  set guifont=Ricty\ Diminished\ Discord:h15
  autocmd GUIEnter * set transparency=200
endif
