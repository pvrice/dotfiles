colorscheme base16-materia
let base16colorspace=256
set background=dark
set termguicolors

set number
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smartindent
set textwidth=80

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

set confirm
set undofile

set ignorecase
set smartcase

set wildignore=*.o,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmode=longest,full
set wildignorecase

map j gj
map k gk

map Y y$

map Q <nop>

map q: :q

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

vnoremap < <gv
vnoremap > >gv

let mapleader="\<Space>"

map <Leader> <nop>

" resume position
augroup LastPosition
    autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

nnoremap <Leader>t :NERDTreeToggle<CR>

nnoremap <silent> <Leader>c :nohlsearch<CR>

nnoremap <Leader>- <C-W>S
nnoremap <Leader>/ <C-W>v

nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l

nnoremap <silent> <Leader>bd :bdelete<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>

map <Leader>; gc
nmap <Leader>;; gcc

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

source ~/.config/nvim/plugins.vim
