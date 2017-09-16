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

" ファイル名表示
" set statusline+=%F
" 変更チェック表示
" set statusline+=%m
" 読み込み専用かどうか表示
" set statusline+=%r
" ヘルプなら[HELP]と表示
" set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
" set statusline+=%w
" フォーマット表示
" set statusline+=\ [FORMAT=%{&ff}]
" エンコード表示
" set statusline+=\ [ENC=%{&fileencoding}]
" ファイルタイプ表示
" set statusline+=\ [TYPE=%Y]
" カーソル位置にあるキャラクタのASCIIおよび16進値表示
"set statusline+=\ [ASCII=\%03.3b]
" カーソル位置表示
" set statusline+=\ [LOW=%l/%L]
" カーソル位置（％）表示
" set statusline+=[%p%%]

" カーソル位置表示
"set statusline+=\ [HEX=\%02.2B]
" カーソル位置表示
"set statusline+=\ [POS=%04l,%04v]
" ファイルの行数表示
"set statusline+=\ [LEN=%L]
"
" コマンドラインの補完
set wildmode=list:longest
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
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" バックスペースキーの有効化
set backspace=indent,eol,start

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" =======================
" autocmd
" =======================
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
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
" tree
nnoremap :tree :NERDTreeToggle
