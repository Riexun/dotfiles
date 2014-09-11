"じぇねらる
set number
syntax on
set t_Co=256
colors jellybeans
set cursorline
set iminsert=0
set laststatus=2

"ふぉんと
set guifont=Ricty\ Discord\ for\ Powerline:h12
set ambiwidth=double

" タブ関係
set tabstop=4
set shiftwidth=4
set autoindent
set guitablabel=%N:%t

"検索関係
set incsearch
set ignorecase
set smartcase

"キーマッピング
imap <A-h> <Left>
imap <A-j> <Down>
imap <A-k> <Up>
imap <A-l> <Right>
"imap <C-j> <esc>
imap <C-k> <esc>

"無限undo
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

"スワップファイルの保存先変更
set directory=~/.vim/tmp

"スワップファイルを作成しない
set noswapfile

"バックスペース関係
set backspace=2
set backspace=indent,eol,start
set nocompatible

"文字コード関係
set encoding=utf-8
scriptencoding utf-8

" パスの設定
augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=C:\MinGW\lib\gcc\mingw32\4.8.1\include,C:\MinGW\lib\gcc\mingw32\4.8.1\include\ssp,C:\MinGW\lib\gcc\mingw32\4.8.1\include\c++
augroup END

augroup c-path
    autocmd!
    autocmd FileType c setlocal path=C:\MinGW\lib\gcc\mingw32\4.8.1\include,C:\MinGW\lib\gcc\mingw32\4.8.1\include\ssp
augroup END


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=$VIMRUNTIME/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-splash'
"NeoBundle 'tyru/eskk.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'osyo-manga/vim-over'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Rip-Rip/clang_complete'
"NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'osyo-manga/vim-marching'
"NeoBundle 'Shougo/neoinclude.vim'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
call neobundle#end()


"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
"     プラグインの設定
"-------------------------
" === NERDTree ===
"<C-e>でNERDTreeをオンオフ。いつでもどこでも。
"	map <silent> <C-e>   :NERDTreeToggle<CR>
"	lmap <silent> <C-e>  :NERDTreeToggle<CR>
"nmap <silent> <C-e>      :NERDTreeToggle<CR>
"vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"omap <silent> <C-e>      :NERDTreeToggle<CR>
"imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
"cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
nmap <silent> <C-e> : NERDTreeFind<CR>

" === lightline ===
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" === Unit.vim ===
"" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" === vim-indent-guides ===
let g:indent_guides_enable_on_vim_startup = 1

"" === neocomplete.vim ===
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#enable_auto_select = 1


" === vim-marching ===
" clang コマンドの設定
let g:marching_clang_command = "C:/bin/LLVM/bin/clang.exe"

" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
\   "cpp" : "-std=gnu++1y"
\}

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
\   "C:/MinGW/lib/gcc/mingw32/4.8.1/include/c++"
\]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するので注意する
"set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" コード補完を行う
" 2回目以降はキャッシュしたデータを使用する
imap <C-x><C-o> <Plug>(marching_start_omni_complete)

" 非同期ではなくて、同期処理でコード補完を行う場合
" この設定の場合は vimproc.vim に依存しない
" let g:marching_backend = "sync_clang_comm

"-------------------------
"   ラグインの設定おわり
"-------------------------

