" standard vim config
syntax on
set background=light
set cursorline
set number
set mouse=a
set nowrap
set ruler
set showmatch
set colorcolumn=101
autocmd BufWritePre * :%s/\s+$//e

" python
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree.vim

" nerdtree [toggle with Ctrl+T and turn on by default]
autocmd vimenter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-T> :NERDTreeToggle<CR>

" ctrl-p [ignore gitignore files and reload every time]
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
\ }

" tabs
nnoremap <C-K> :tabprevious<CR>
nnoremap <C-J> :tabnext<CR>

