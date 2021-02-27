" standard vim config
syntax on
set background=light
set cursorline
set number
set mouse=ni
set ttymouse=sgr
set nowrap
set ruler
set showmatch
set colorcolumn=101
set clipboard=unnamed
autocmd BufWritePre * %s/\s\+$//e
colorscheme Tomorrow-Night

" python
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree.vim
set runtimepath^=~/.vim/bundle/syntastic.vim

" nerdtree [toggle with Ctrl+T and turn on by default, including new tabs, close if last tab]
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufWinEnter * if !argc() | NERDTreeMirror | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-T> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" ctrl-p [ignore gitignore files and reload every time]
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'], }

" syntastic (disabled by default until C-F)
autocmd FileType python map <buffer> <C-F> :call SyntasticCheck()<CR>
autocmd VimEnter * SyntasticToggleMode
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
nnoremap <C-N> :lnext<CR>
nnoremap <C-M> :lprevious<CR>

" tabs navigation
nnoremap <C-K> :tabprevious<CR>
nnoremap <C-J> :tabnext<CR>

" windows navigation
nnoremap <C-A> :wincmd w<CR>

" copy the current line into clipboard, without preceding whitespace
noremap Y ^y$

" sync clipboard over ssh, thanks to leeren chang
" [this should be un-commented on the remote machine, commented on the local machine]
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/tty")
endfunction
command! Osc52CopyYank call Osc52Yank()
augroup Example
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END


