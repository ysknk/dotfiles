" =======================
" init set
" =======================
" vi互換モードで動作させない
if !&compatible
  set nocompatible
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" =======================
" init dein
" =======================
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir = expand('~/.deinrc/')
  let s:fast   = g:rc_dir . 'fast.toml'
  let s:lazy   = g:rc_dir . 'lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:fast, {'lazy': 0})
  call dein#load_toml(s:lazy, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" neocomplete
let g:neocomplete#enable_at_startup = 1

" =======================
" set
" =======================
" シンタックスハイライトを有効にする
syntax enable
" バックアップファイルを作らない
set nobackup
set noundofile
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 現在のモードを表示
set showmode
" 入力中のコマンドをステータスに表示する
set showcmd
" デフォルトエンコード設定
set encoding=utf-8
" コピーをクリップボードに保持
set clipboard+=unnamed
" 行番号を表示する
set number
" カーソルの位置を表示する
set ruler
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
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
" コマンドラインの補完
set wildmode=longest:full,full
" 不可視文字を可視化
set list
set listchars=tab:>-,trail:-,nbsp:%,eol:$
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
" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000

" =======================
" autocmd
" =======================
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" highlightカラー
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

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
" tree
nnoremap :tree :NERDTreeToggle
nnoremap <silent><C-e> :NERDTreeToggle<CR>
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
