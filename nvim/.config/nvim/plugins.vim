set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')

    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('AndrewRadev/sideways.vim')
    call dein#add('benekastah/neomake')
    " call dein#add('morhetz/gruvbox')
    call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim', { 'depends': 'neosnippet-snippets' })
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tommcdo/vim-exchange')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-sleuth')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('vim-airline/vim-airline')

    call dein#add('eagletmt/neco-ghc', { 'for': 'haskell' })
    call dein#add('neovimhaskell/haskell-vim', { 'for': 'haskell' })
    " call dein#add('alx741/vim-hindent', { 'for': 'haskell' })

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" general
" Plug 'benekastah/neomake'
" Plug 'ervandew/supertab'
" Plug 'jiangmiao/auto-pairs'
" Plug 'peterrincker/vim-argumentative'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'shougo/deoplete.nvim'
" Plug 'shougo/neomru.vim' | Plug 'shougo/unite.vim'
" Plug 'tommcdo/vim-exchange'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" " haskell
" Plug 'shougo/vimproc', { 'do': 'make'} | Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

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
autocmd! BufWritePost,BufReadPost *.{c,h,hs} Neomake
autocmd! VimLeave * let g:neomake_verbose = 0

" sideways
omap aa <Plug>SidwaysArgumentTextobjA
xmap aa <Plug>SidwaysArgumentTextobjA
omap ia <Plug>SidwaysArgumentTextobjI
xmap ia <Plug>SidwaysArgumentTextobjI

" necoghc
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
