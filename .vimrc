set nocompatible

let python_highlight_all=1
syntax on

filetype plugin indent on

call plug#begin('~/.vim/plugged')

" === General ===
" Powerline status bar
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" File Browser
Plug 'scrooloose/nerdtree'

" improved tab completition
Plug 'ervandew/supertab'

" Snippet Engine
Plug 'SirVer/ultisnips'

" Syntax Checking on Saving
" Plug 'vim-syntastic/syntastic'

" Highlight bad whitespace
Plug 'bitc/vim-bad-whitespace'

" === python ===
" python autocompletion, goto definition and usages
Plug 'davidhalter/jedi-vim'

" PEP8 checking with F7
Plug 'nvie/vim-flake8'

" python indentation, better handling of multiline continuation
Plug 'vim-scripts/indentpython.vim'

" Update python docstrings
Plug 'heavenshell/vim-pydocstring'

" Snippets for python
Plug 'honza/vim-snippets'

" === golang ===
" Go support
Plug 'fatih/vim-go'

call plug#end()

" === General ===
" Leader key
let mapleader = " "

" Buffer Switching
nnoremap <Leader>h :bn<CR>
nnoremap <Leader>l :bp<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

" Close buffer keeping the split
nnoremap <Leader>w :bp<CR>:bd #<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" System Clipboard
set clipboard=unnamedplus
vnoremap <C-S-C> "+y
inoremap <C-S-V> <ESC>"+pa
nnoremap <C-S-V> "+pa

" Remap the Escape key
:imap jk <ESC>

" Encoding
set encoding=utf-8

" Hybrid line numbers
set number relativenumber

" Highlight matching search patterns
set hlsearch

" Include matching uppercase words with lowercase search terms
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Open new splits right/below
set splitright
set splitbelow

" indentation
set tabstop=4
set shiftwidth=4
set expandtab
function ToggleTab()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfunction
nnoremap <F9> mz:execute ToggleTab()<CR>'z

" show tabs and trailing whitespace
set list
set listchars=tab:!·,trail:·

" Toggle NERDTree and enable deleting
nmap <C-n> :NERDTreeToggle<CR>
set modifiable

" Supertab scrolling order
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" UltiSnips trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" mark n lines
nnoremap <Leader>m :<C-U>call CopyLines()<CR>
function! CopyLines()
    let c = v:count1
    execute "normal! 0vk" . c . "jg_\"+y"
endfunction

" === python ===
" Jedi-Vim customization
let g:jedi#use_splits_not_buffers = "left"

" commenting in python
nnoremap <Leader>c :normal! 0i# <CR>
nnoremap <Leader>u :normal! 02x<CR>

" adding documentation in python
let g:pydocstring_enable_mapping = 0
nnoremap <Leader>f :Pydocstring<CR>

" python PEP8 Compliance
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
