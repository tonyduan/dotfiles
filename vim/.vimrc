" standard vim config
syntax on
set background=light
set cursorline
set number
set mouse=a
set nowrap
set ruler

" python
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" pathogen
execute pathogen#infect()

" plugins
nnoremap <leader>o :CtrlP<Cr>
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_meaningful_tab_names=1
let g:ctrlp_show_hidden = 1
autocmd vimenter * if !argc() | NERDTree | endif

