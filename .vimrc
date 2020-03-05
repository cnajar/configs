syntax on

set cursorline
set cursorcolumn
set autoindent
set smartindent
set hlsearch
"set number

set paste
"Disable vim automatic visual mode on mouse select
set mouse-=a
"Mouse wheel scrolling
"set mouse=a
set ttymouse=sgr

"-----
"-----
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'

" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" Flagging Unnecessary Whitespace
""" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"For the most part, you should be using UTF-8 when working with Python, especially if you’re working with Python 3.
set encoding=utf-8

" Auto-Complete
Bundle 'Valloric/YouCompleteMe'
" let’s add a few customizations:
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'

" Add PEP 8 checking
Plugin 'nvie/vim-flake8'

" make your code look pretty
let python_highlight_all=1

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
"" Solarized also ships with a dark and light theme. To make switching between them very easy (press F5)
"call togglebg#map("<F5>")
" black background
hi Normal ctermbg=black

" Git Integration
Plugin 'tpope/vim-fugitive'

