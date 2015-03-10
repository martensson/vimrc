" .vimrc
" Author: Benjamin Mårtensson <benji@psy.nu>
" Source: https://github.com/bmartensson/vimrc

set nocompatible               " be iMproved
filetype off

call plug#begin('~/.vim/plugged')

" My Plugins
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'hdima/python-syntax'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'smerrill/vcl-vim-plugin'
Plug 'rodjek/vim-puppet'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'mhinz/vim-startify'
Plug 'ervandew/supertab'
Plug 'ryanss/vim-hackernews'
Plug 'joshhartigan/vim-reddit'

call plug#end()
filetype plugin indent on    " required

" Plugin settings
let g:go_bin_path = expand("~/.go/bin")
let g:go_fmt_command = "goimports"
let g:gitgutter_realtime = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:airline_theme='badwolf'
let g:ctrlp_follow_symlinks = 2
let g:vim_markdown_folding_disabled=1
let g:SuperTabDefaultCompletionType = "context"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Lets make Vim python pep8 compliant.
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set wrap
set formatoptions=qrn1
" set colorcolumn=+1

" syntax highlight
syntax on
set shell=bash
set background=dark
set t_Co=256
let g:rehash256=1
colorscheme molokai

" leader
let mapleader = "-"

" fix anoying jk wrapped lines movement
nmap j gj
nmap k gk

set encoding=utf-8
set guioptions-=T " hide menu bar in gvim/macvim
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

" search
set ignorecase
set smartcase
set incsearch
set showmatch
set matchtime=3
set hlsearch
set splitbelow
set splitright

" backup
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup

" some random improvements
set scrolloff=3 " Number of lines above/below cursor
set showmode
set showcmd
set hidden

" wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store? " OSX bullshit

" make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" sudo to write
cmap w!! w !sudo tee % >/dev/null

" quick maps
nnoremap <leader>s :source $MYVIMRC<cr> " reload vimrc
nnoremap <leader>w :%s/\s\+$//<cr>
inoremap jk <esc>

" resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
    
" Uncomment the following to have Vim jump to the last position when
" reopening a file
augroup remember_position
autocmd!
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal g`\"" | endif
augroup END
