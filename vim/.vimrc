" standard vim config
syntax on
set background=light
set cursorline
set cursorcolumn
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
set laststatus=2
set pastetoggle=<F2>

" python
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree.vim
set runtimepath^=~/.vim/bundle/python-syntax.vim

let g:python_highlight_all = 1

" nerdtree [toggle with Ctrl+T and turn on by default, including new tabs, close if last tab]
nmap <C-T> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" ctrl-p [ignore gitignore files and reload every time]
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'], }

" ale
nmap <silent> <C-N> <Plug>(ale_previous_wrap)
nmap <silent> <C-M> <Plug>(ale_next_wrap)
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {'python': ['ruff']}

" tabs navigation
nnoremap <C-K> :tabprevious<CR>
nnoremap <C-J> :tabnext<CR>

" windows navigation
nnoremap <C-A> :wincmd w<CR>

" copy the current line into clipboard, without preceding whitespace
noremap Y ^y$

" sync clipboard over ssh, thanks to leeren chang
" [this should be un-commented on the remote machine, commented on the local machine]
"function! Osc52Yank()
"    let buffer=system('base64 -w0', @0)
"    let buffer=substitute(buffer, "\n$", "", "")
"    let buffer='\e]52;c;'.buffer.'\x07'
"    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/tty")
"endfunction
"command! Osc52CopyYank call Osc52Yank()
"augroup Example
"    autocmd!
"    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
"augroup END
"
