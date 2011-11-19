" .vimrc
" Author: Benjamin Mårtensson <benji@psy.nu>
" Source: https://github.com/bmartensson/vimrc

set nocompatible
set guioptions-=T " hide meny bar in gvim/macvim
set background=dark 
set t_Co=256 " needed for 256 colors.
let g:molokai_original = 1 
colorscheme molokai
syntax on

" Indent settings 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Search settings 
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Backup stuff.
set undodir=~/.vim/tmp/undo/     
set backupdir=~/.vim/tmp/backup/ 
set directory=~/.vim/tmp/swap/ 
set backup

" Lets limit the width, shall we.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Some random improvements
set encoding=utf-8
set scrolloff=3 " Number of lines above/below cursor
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
" set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
