source ~/.config/nvim/plugins.vim

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
set termguicolors
set lazyredraw

set number
set relativenumber

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set smartindent
set textwidth=80

set hidden

set scrolloff=2
set sidescrolloff=5

set shell=/usr/bin/fish

set splitbelow
set splitright

set cursorline

set confirm
set undofile

set ignorecase
set smartcase

set wildignore=*.o,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmode=longest,list
set wildignorecase

noremap j gj
noremap k gk

nnoremap Y y$

nnoremap Q <nop>

nnoremap q: :q

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

vnoremap < <gv
vnoremap > >gv

let mapleader=","

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

" depends on vim-surround
imap <C-A> <C-G>S{
