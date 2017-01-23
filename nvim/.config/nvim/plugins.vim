call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'peterrincker/vim-argumentative'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'shougo/deoplete.nvim'
Plug 'shougo/neomru.vim' | Plug 'shougo/unite.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
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

" unite
" nnoremap <Leader>ff :Unite file/async<CR>
nnoremap <Leader>ff :Unite file_rec/async<CR>
nnoremap <Leader>fr :Unite file_mru<CR>

nnoremap <Leader>b :Unite buffer<CR>

nnoremap <Leader><Leader> :Unite grep:.<CR>

" let g:unite_source_history_yank_enable = 1
" nnoremap <Leader>y :Unite history/yank<CR>

" airline
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
autocmd! BufWritePost * Neomake
