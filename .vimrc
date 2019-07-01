set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set fileformats=unix,dos,mac
scriptencoding utf-8

" =======================
" base set
" =======================
" Windows でもパスの区切り文字を / にする
set shellslash

let s:cache_dir = '~/.cache'

let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')

" shell alias
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
if has("win64") || has("win32unix") || has("win32")
  let g:vimproc#download_windows_dll = 1
endif

" =======================
" init dein
" =======================
let g:dein#install_process_timeout = 600
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand(s:cache_dir . '/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

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
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir = expand('~/.deinrc/')
  let s:fast = g:rc_dir . 'fast.toml'
  let s:lazy = g:rc_dir . 'lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:fast, {'lazy': 0})
  call dein#load_toml(s:lazy, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" =======================
" init set
" =======================
" シンタックスハイライトを有効にする
syntax enable
" バックアップファイル
" set nobackup
set backupdir&
let &backupdir=expand(s:cache_dir)
" チルダファイル
" set noundofile
set undodir&
let &undodir=expand(s:cache_dir)
" スワップファイル
" set noswapfile
set directory&
let &directory=expand(s:cache_dir)
" viminfo
" set viminfo=
set viminfo&
let &viminfo.= ',n' . expand(s:cache_dir) . '/viminfo'

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 現在のモードを表示
set showmode
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
" コマンドラインでの補完にポップアップメニューを使う
set wildoptions=pum
" ポップアップメニューを半透明に
set pumblend=10
" 不可視文字を可視化 ",eol:$
set list
set listchars=tab:>-,trail:-,nbsp:%,eol:↲
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
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
set history=2048
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
" □や○文字が崩れる問題を解決
set ambiwidth=double
" 全角括弧関連
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
" 常に行数左側のカラムを表示する
set signcolumn=yes
" カーソルが一番上や下に移動した時のビープ音を消す＆画面フラッシュも消す
set vb t_vb=
" ターミナルでも True Color を使えるように
if has("termguicolors")
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif
" =======================
" php set
" =======================
" 文字列中のSQLをハイライトする
let php_sql_query=1
" Baselibメソッドのハイライト
let php_baselib=1
" <? をハイライト除外する
let php_htmlInStrings=1
" ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags=1
" 折りたたみ
" zo: 開く (カーソルが折りたたまれた行の上にあるとき)
" zc: 閉じる (折りたたまれる範囲中で)
" zR: ぜんぶ開く
" zM: ぜんぶ閉じる
" zj: 次に移動
" zk: 前に移動
let php_folding=1
" カッコが閉じていない場合にハイライト
let php_parent_error_close=1

augroup vimrc-filetype
  autocmd!
  " PHP set
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" =======================
" autocmd
" =======================
"ファイルを開くと、ファイルがあるディレクトリに移動する
augroup grlcd
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END
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
      setlocal cursorcolumn
      let g:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
      setlocal nocursorcolumn
    elseif a:event ==# 'CursorMoved'
      if g:cursorline_lock
        if 1 < g:cursorline_lock
          let g:cursorline_lock = 1
        else
          setlocal nocursorline
          setlocal nocursorcolumn
          let g:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      setlocal cursorcolumn
      let g:cursorline_lock = 1
    endif
  endfunction
augroup END
" 任意のウィンドウを半透明に
augroup transparent-windows
  autocmd!
  autocmd FileType denite set winblend=10
  autocmd FileType denite-filter set winblend=10
augroup END
" =======================
" keymap
" =======================
" F1でvimrcを開く
nnoremap <F1> :tabnew $MYVIMRC<CR>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
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
