filetype plugin indent on
syntax on

set background=dark

set number

set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smartindent

set nrformats+=alpha

set hidden
set ruler

set scrolloff=1
set sidescrolloff=5

set shell=/usr/bin/zsh

set showmode
set showcmd

set splitbelow
set splitright

set cursorline
set report=0

set autochdir
set confirm
set undofile

augroup LastPosition
    autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

set ignorecase
set smartcase

set wildignore=*.o,.git\*,.hg\*,.svn\*
set wildmode=longest,full
set wildignorecase

map j gj
map k gk

map Y y$

map Q <nop>

nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

let mapleader="\<Space>"
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>Q :q!<CR>
map <Leader>wq :wq<CR>
map <Leader>ee :e <c-r>=expand("%:p:h")<cr>/

map <Leader><Space> /
map <Leader><M-Space> ?
map <silent> <Leader>sc :nohlsearch<CR>

map <Leader>we :new 
map <Leader>wc :q<CR>
map <Leader>w- :split<CR>
map <Leader>w/ :vsplit<CR>
map <Leader>wj <C-W>j
map <Leader>wk <C-W>k
map <Leader>wh <C-W>h
map <Leader>wl <C-W>l

map <Leader>bd :bdelete<CR>
map <Leader>bD :bdelete!<CR>
map <Leader>l :bnext<CR>
map <Leader>h :bprev<CR>

map <Leader>tn :tabnew<CR>
map <Leader>to :tabonly<CR>
map <Leader>td :tabclose<CR>
map <Leader>tl :tabnext<CR>
map <Leader>th :tabprev<CR>
map <Leader>te :e <c-r>=expand("%:p:h")<cr>/


let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <Leader>cd :cd %:p:h<CR>:pwd<CR>


vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
