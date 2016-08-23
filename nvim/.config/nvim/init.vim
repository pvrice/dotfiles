call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'peterrincker/vim-argumentative'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'shougo/deoplete.nvim'
Plug 'shougo/neomru.vim' | Plug 'shougo/unite.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" haskell
Plug 'shougo/vimproc', { 'do': 'make'} | Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" c
" Plug 'zchee/deoplete-clang', { 'for': 'c' }

call plug#end()

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

map q: :q

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

vnoremap < <gv
vnoremap > >gv

let mapleader="\<Space>"

map <Leader> <nop>

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>
nnoremap <Leader>qq :qall<CR>
nnoremap <Leader>qw :wqall<CR>

nnoremap <silent> <Leader>sc :nohlsearch<CR>

nnoremap <silent> <Leader>w- :split<CR>
nnoremap <silent> <Leader>w/ :vsplit<CR>
" stupid
nnoremap <BS>  <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <silent> <Leader>bd :bdelete<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>

" gitgutter
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
nnoremap [og :GitGutterSignsEnable<CR>
nnoremap ]og :GitGutterSignsDisable<CR>
nnoremap cog :GitGutterSignsToggle<CR>
nnoremap <Leader>gn <Plug>GitGutterNextHunk
nnoremap <Leader>gp <Plug>GitGutterPrevHunk
nnoremap <Leader>gs <Plug>GitGutterStageHunk
nnoremap <Leader>gu <Plug>GitGutterRevertHunk
nnoremap <Leader>gv <Plug>GitGutterPreviewHunk

map <Leader>; gc
nmap <Leader>;; gcc

nnoremap <Leader>ce :botright cope<CR>
nnoremap <Leader>cc :ccl<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>

nnoremap <Leader>le :botright lope<CR>
nnoremap <Leader>lc :lcl<CR>
nnoremap <Leader>ln :lne<CR>
nnoremap <Leader>lp :lp<CR>

autocmd! FileType haskell
            \ setlocal formatprg=hindent\ --line-length\ 80 |
            \ nnoremap <Leader>mt :GhcModType<CR> |
            \ nnoremap <Leader>mT :GhcModTypeInsert<CR> |
            \ nnoremap <Leader>mc :GhcModTypeClear<CR> |
            \ nnoremap <Leader>ms :GhcModSplitFunCase<CR> |
            \ nnoremap <Leader>ml :GhcModLintAsync<CR>

" autocmd! BufWritePost *.hs GhcModCheckAndLintAsync

let g:necoghc_enable_detailed_browse = 1

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" unite
" nnoremap <Leader>ff :Unite file/async<CR>
nnoremap <Leader>ff :Unite file_rec/async<CR>
nnoremap <Leader>fr :Unite file_mru<CR>

nnoremap <Leader>bb :Unite buffer<CR>

nnoremap <Leader>/ :Unite grep:.<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite history/yank<CR>

" sneak
let g:sneak#streak = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" neco-ghc
let g:necoghc_enable_detailed_browse = 1

" neomake
autocmd! BufWritePost * Neomake

let g:AutoPairsFlyMode = 1
