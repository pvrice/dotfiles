call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
filetype plugin indent on
syntax on

let base16colorspace=256
colorscheme base16-eighties
set background=dark

set number
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smartindent

set nrformats+=alpha

set hidden
set ruler

set scrolloff=2
set sidescrolloff=5

set shell=/usr/bin/zsh

set showmode
set showcmd

set splitbelow
set splitright

set cursorline
set report=0

" set autochdir
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

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

vnoremap < <gv
vnoremap > >gv

let mapleader="\<Space>"
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>wq :wq<CR>

map <Leader><Space> /
map <Leader><M-Space> ?
map <silent> <Leader>sc :nohlsearch<CR>

map <Leader>sc :q<CR>
map <Leader>s- :split<CR>
map <Leader>s/ :vsplit<CR>
map <Leader>sj <C-W>j
map <Leader>sk <C-W>k
map <Leader>sh <C-W>h
map <Leader>sl <C-W>l

map <Leader>bd :bdelete<CR>
map <silent> <Leader>l :bnext<CR>
map <silent> <Leader>h :bprev<CR>

map <Leader>tn :tabnew<CR>
map <Leader>to :tabonly<CR>
map <Leader>td :tabclose<CR>
map <silent> <C-j> :tabnext<CR>
map <silent> <C-k> :tabprev<CR>

let g:lasttab = 1
nmap <silent> <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <Leader>cc :botright cope<CR>
map <Leader>cn :cn<CR>
map <Leader>cp :cp<CR>

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" fzf
map <Leader>ff :Files<CR>
map <Leader>bb :Buffers<CR>
map <Leader>sl :Lines<CR>
map <Leader>ww :Windows<CR>

" sneak
let g:sneak#streak = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
