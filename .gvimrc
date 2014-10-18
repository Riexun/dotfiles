"GVimのメニュー削除
"set guioptions-=m
"ツールバー
set guioptions-=T

"メニューバーの文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"フォント
set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
set guifontwide=Ricty\ Discord\ for\ Powerline\ 12
