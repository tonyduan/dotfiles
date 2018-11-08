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
let g:ctrlp_show_hidden = 1
autocmd vimenter * if !argc() | NERDTree | endif

call pathogen#helptags()
