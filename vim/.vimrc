" standard vim config
syntax on
set background=light
set cursorline
set number
set mouse=a
set nowrap
set ruler
set colorcolumn=80
autocmd BufWritePre * :%s/\s+$//e

" python
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree.vim
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

