" .vimrc
" Author: Benjamin Mårtensson <benjamin@martensson.io>
" Source: https://github.com/martensson/vimrc

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
" PLUGINS

" Visual stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'cespare/vim-toml'

" Markdown / Writing
Plug 'plasticboy/vim-markdown'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

" Hacking
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'smerrill/vcl-vim-plugin'
Plug 'rodjek/vim-puppet'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'

" Extra fun stuff
Plug 'ryanss/vim-hackernews'
Plug 'joshhartigan/vim-reddit'

call plug#end()
filetype plugin indent on    " required

" Plugin settings
let g:go_bin_path = expand("~/Dropbox/Private/code/go/bin")
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:gitgutter_realtime = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:ctrlp_follow_symlinks = 2
let g:vim_markdown_folding_disabled=1
let g:SuperTabDefaultCompletionType = "context"

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set wrap
set formatoptions=qrn1

" sync wih os clipboard
set clipboard=unnamed

" visual settings
syntax on
set shell=bash
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True gui colors in terminal
"set t_Co=256
"let g:rehash256=1
colorscheme molokai
let g:airline_theme='raven'

" leader
let mapleader = "\<Space>"

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
set undofile

" some random improvements
set scrolloff=3 " Number of lines above/below cursor
set showmode
set showcmd
set hidden

" wildmenu
set wildmenu
set wildmode=list:longest

" make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" sudo to write
cmap w!! w !sudo tee % >/dev/null

" quick maps
nnoremap <leader>w :%s/\s\+$//<cr>
inoremap jk <esc>

" Go stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>e <Plug>(go-rename)

" resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Uncomment the following to have Vim jump to the last position when
" reopening a file
augroup remember_position
autocmd!
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal g`\"" | endif
augroup END

" To fix navigaion in neovim terminal
if has('nvim')
  tnoremap jk <c-\><c-n>
endif
