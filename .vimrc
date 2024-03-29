set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,ucs-bom,sjis,euc-jp,cp932,default,latin1
set fileformats=unix,dos,mac
scriptencoding utf-8

" =======================
" base set
" =======================
filetype off
filetype plugin indent off

let mapleader = '\<Space>'
set rtp+=/usr/local/opt/fzf

if has('python3')
endif

" Windows でもパスの区切り文字を / にする
set shellslash

" カーソル下のhighlight情報を表示する HighlightInfo
function! s:get_syn_id(transparent)
  let synid = synID(line('.'), col('.'), 1)
  return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
  return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
  execute "highlight " . s:get_syn_name(s:get_syn_id(0))
  execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()

" ネストしたディレクトリを作成する関数
function! s:mkdir(dir)
  if !isdirectory(a:dir)
    " 'p' を渡すことでネストしたディレクトリ全てが作成される
    call mkdir(a:dir, "p")
  endif
endfunction

let s:editor = 'vim'
if has('nvim')
  let s:editor = 'nvim'
endif

let s:tmp_dir = expand('~/.temp/' . s:editor)
" call s:mkdir(&s:tmp_dir)
let s:cache_dir = expand('~/.cache/' . s:editor)
" call s:mkdir(&s:cache_dir)
let s:undo_dir = expand(s:cache_dir . '/.undo')
let s:backup_dir = expand(s:cache_dir . '/.backup')
let s:swap_dir = expand(s:cache_dir . '/.swap')

" shell alias
if &shell =~ '\\bash$'
  set shell=bash shellcmdflag=-c
endif
if &shell =~# 'fish$'
  set shell=sh
endif
" vi互換モードで動作させない
if !&compatible
  set nocompatible
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" windows dll download
if has('win64') || has('win32unix') || has('win32')
  let g:vimproc#download_windows_dll = 1
endif

" =======================
" init dein
" =======================
let g:dein#install_process_timeout = 600
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand(s:cache_dir . '/dein')
" dein.vim 本体
let s:dein_repo_dir = expand(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  " execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  let g:vimrc_dir = expand('~/_deinrc/')
  let s:fast = g:vimrc_dir . 'fast.toml'
  let s:lazy = g:vimrc_dir . 'lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:fast, {'lazy': 0})
  call dein#load_toml(s:lazy, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

syntax enable

" もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" =======================
" init set
" =======================
let $PATH = '~/.pyenv/shims:'.$PATH
if has('nvim')
  let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/neovim2/bin/python") || echo -n $(which python2)')
  let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/neovim3/bin/python") || echo -n $(which python3)')
endif

" TMPファイル
let $TMPDIR = expand(s:tmp_dir)
" バックアップファイル
" set nobackup
set backupdir&
let &backupdir=expand(s:backup_dir)
call s:mkdir(&backupdir)
" チルダファイル
" set noundofile
if has('persistent_undo')
  set undodir&
  let &undodir=expand(s:undo_dir)
  call s:mkdir(&undodir)
  set undofile
endif
" スワップファイル
" set noswapfile
set directory&
let &directory=expand(s:swap_dir)
call s:mkdir(&directory)
" viminfo
" set viminfo=
set viminfo&
let &viminfo.= ',n' . expand(s:cache_dir) . '/viminfo'

" マルチバイト文字対策
" 日本語(マルチバイト文字)行の連結時には空白を入力しない。
set formatoptions+=mMj
" □や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
" 画面最後の行をできる限り表示する。
set display+=lastline
" 不要な再描画をしない（関連ファイルから正常に開かないためdisabled）
" set lazyredraw
" 正規表現エンジンの切り替え
set re=2
" ターミナル接続を高速化
set ttyfast

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 現在のモードを表示
" set showmode
" 現在のモードを表示しない
set noshowmode
" マウス操作を有効にする
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif
" 入力中のコマンドをステータスに表示する
set showcmd
" コピーをクリップボードに保持
set clipboard+=unnamed
" 行番号を表示する
set number
" カーソルの位置を表示する
set ruler
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドモードの補完
set wildmenu
" コマンドラインの補完
set wildmode=longest:full,full
" vim script内の再帰処理回数
set maxfuncdepth=1000
" 文字検索時カウント表示
set shortmess-=S

" if has('nvim')
"   " コマンドラインでの補完にポップアップメニューを使う
"   set wildoptions=pum
"   " ポップアップメニューを半透明に
"   set pumblend=10
" endif

" 不可視文字を可視化 ",eol:$
set list
set listchars=tab:>-,trail:-,nbsp:%,eol:↲
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" ターミナルウインドウの表示サイズ
if !has('nvim')
  set termwinsize=8x0
endif
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" http://qiita.com/ahiruman5/items/4f3c845500c172a02935
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~
" バックスペースキーの有効化
set backspace=indent,eol,start
" 保存するコマンド履歴の数
set history=10000
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
" 全角括弧関連
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
" 常に行数左側のカラムを表示する
set signcolumn=yes
" カーソルが一番上や下に移動した時のビープ音を消す＆画面フラッシュも消す
set vb t_vb=
" ターミナルでも True Color を使えるように
if has('termguicolors')
  " set t_8f=\[[38;2;%lu;%lu;%lum
  " set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif

" =======================
" autocmd
" =======================
" 開いた箇所を自動的に作業ディレクトリにする
augroup auto_lcd
  autocmd!
  autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h | endif
augroup End
" highlightカラー
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" grep + quickfix
autocmd QuickFixCmdPost *grep* cwindow
" cursorline
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call Auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call Auto_cursorline('CursorHold')
  autocmd WinEnter * call Auto_cursorline('WinEnter')
  autocmd WinLeave * call Auto_cursorline('WinLeave')

  let g:cursorline_lock = 0
  function! Auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      " setlocal cursorcolumn
      let g:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
      " setlocal nocursorcolumn
    elseif a:event ==# 'CursorMoved'
      if g:cursorline_lock
        if 1 < g:cursorline_lock
          let g:cursorline_lock = 1
        else
          setlocal nocursorline
          " setlocal nocursorcolumn
          let g:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      " setlocal cursorcolumn
      let g:cursorline_lock = 1
    endif
  endfunction
augroup END
if has('nvim')
  " 任意のウィンドウを半透明に
  augroup transparent-windows
    autocmd!
    autocmd FileType denite set winblend=10
    autocmd FileType denite-filter set winblend=10
  augroup END
endif
" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" =======================
" keymap
" =======================
" F1でvimrcを開く
nnoremap <F1> :tabnew $MYVIMRC<CR>
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" jjと入力することでEsc扱いに
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>
" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" Shift+hjklで移動量を大きく
nnoremap H 3h
nnoremap J 3j
nnoremap K 3k
nnoremap L 3l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" 選択行列の可視化切り替え
map <C-F2> :set cursorcolumn!<Bar>set cursorline!<CR>
" コピペが連続でできるように
xnoremap <expr> p 'pgv"'.v:register.'ygv<esc>'

filetype plugin indent on

