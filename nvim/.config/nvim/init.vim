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
Plug 'shougo/unite.vim'
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
Plug 'zchee/deoplete-clang', { 'for': 'c' }

call plug#end()

filetype plugin indent on
syntax on

colorscheme base16-materia
let base16colorspace=256
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

nmap <Leader>fs :w<CR>
nmap <Leader>ft :NERDTreeToggle<CR>
nmap <Leader>qq :q<CR>
nmap <Leader>qa :qall<CR>
nmap <Leader>qw :wqall<CR>

nmap <silent> <Leader>sc :nohlsearch<CR>

nmap <silent> <Leader>w- :split<CR>
nmap <silent> <Leader>w/ :vsplit<CR>
nmap <Leader>wj <C-W>j
nmap <Leader>wk <C-W>k
nmap <Leader>wh <C-W>h
nmap <Leader>wl <C-W>l
nmap <Leader>wz <C-W>z

nmap <silent> <Leader>bd :bdelete<CR>
nmap <silent> <Leader>bn :bnext<CR>
nmap <silent> <Leader>bp :bprev<CR>

" toggles from vim-unimpaired
" map <Leader>ttb cob  " background
" map <Leader>ttc coc  " cursorline
" map <Leader>ttd cod  " diff
" map <Leader>tth coh  " hlsearch
" map <Leader>tti coi  " ignorecase
" map <Leader>ttl col  " list
" map <Leader>ttn con  " number
" map <Leader>ttr cor  " relativenumber
" map <Leader>tts cos  " spell
" map <Leader>ttu cou  " cursorcolumn
" map <Leader>ttv cov  " virtualedit
" map <Leader>ttw cow  " wrap
" map <Leader>ttx cox  " cursorline cursorcolumn

" gitgutter
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
nmap [og :GitGutterSignsEnable<CR>
nmap ]og :GitGutterSignsDisable<CR>
nmap cog :GitGutterSignsToggle<CR>
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gp <Plug>GitGutterPrevHunk
nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterRevertHunk
nmap <Leader>gv <Plug>GitGutterPreviewHunk

map <Leader>; gc
nmap <Leader>;; gcc

" nmap <Leader>cc :Neomake<CR>
nmap <Leader>ce :botright cope<CR>
nmap <Leader>cn :cn<CR>
nmap <Leader>cp :cp<CR>

nmap <Leader>le :botright lope<CR>
nmap <Leader>ln :lne<CR>
nmap <Leader>lp :lp<CR>

autocmd! FileType haskell
            \ nmap <silent> <Leader>mt :GhcModType<CR> |
            \ nmap <silent> <Leader>mT :GhcModTypeInsert<CR> |
            \ nmap <silent> <Leader>mc :GhcModTypeClear<CR> |
            \ nmap <silent> <Leader>ms :GhcModSplitFunCase<CR>

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" fzf
" nmap <Leader>ff :Files<CR>
" nmap <Leader>bb :Buffers<CR>
" nmap <Leader>sl :Lines<CR>
" nmap <Leader>ww :Windows<CR>

" unite
nmap <Leader>ff :Unite file/async<CR>
nmap <Leader>fr :Unite file_rec/async<CR>

nmap <Leader>bb :Unite buffer<CR>

nmap <Leader>/ :Unite grep:.<CR>

let g:unite_source_history_yank_enable = 1
nmap <Leader>y :Unite history/yank<CR>

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
