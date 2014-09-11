"GVimのメニュー削除
"set guioptions-=m
"set guioptions-=T

"メニューバーの文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
