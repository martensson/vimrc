" .vimrc
" Author: Benjamin Mårtensson <benji@psy.nu>
" Source: https://github.com/bmartensson/vimrc

" leader
let mapleader = "-"

let g:molokai_original = 1 
colorscheme molokai
syntax on
set encoding=utf-8
set nocompatible
set guioptions-=T " hide meny bar in gvim/macvim
set background=dark 
set t_Co=256 " needed for 256 colors.
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" search
set ignorecase
set smartcase
set incsearch
set showmatch
set matchtime=3
set hlsearch
set splitbelow
set splitright

" regex searching
nnoremap / /\v 
vnoremap / /\v

" backup
set undodir=~/.vim/tmp/undo/     
set backupdir=~/.vim/tmp/backup/ 
set directory=~/.vim/tmp/swap/ 
set backup

" width
set wrap
set textwidth=85
set formatoptions=qrn1
set colorcolumn=+1

" some random improvements
set encoding=utf-8
set scrolloff=3 " Number of lines above/below cursor
set autoindent
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

" status line
set statusline=%F%m%r%h%w
set statusline+=\ %#warningmsg#
set statusline+=%*
set statusline+=%=(%{&ff}/%Y)
set statusline+=\ (line\ %l\/%L,\ col\ %c)

" sudo to write
cmap w!! w !sudo tee % >/dev/null


" quick maps
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>h :split ~/.vim/text/vimtips.txt<cr>
inoremap jk <esc>

" resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
