set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')

    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/deoplete.nvim')

    " always active, mostly don't require interaction
    call dein#add('morhetz/gruvbox')
    call dein#add('vim-airline/vim-airline')
    " a -- text object
    call dein#add('vim-scripts/argtextobj.vim')
    " <C-k> in completion menu -- expand snippet
    call dein#add('Shougo/neosnippet.vim', { 'depends': 'neosnippet-snippets' })
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-sleuth')

    " mostly need to be explicitly invoked
    " :Neomake, etc
    call dein#add('benekastah/neomake')
    " :NERDTreeToggle, etc
    call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
    " cx, v_X -- exchange, cxc -- clear
    call dein#add('tommcdo/vim-exchange')
    " gc, :Commentary -- comment
    call dein#add('tpope/vim-commentary')
    " :Gstatus, etc, etc
    call dein#add('tpope/vim-fugitive')
    " I've got this memorized
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')

    " haskell
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
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''

" vim-surround
imap <C-A> <C-S><C-S>B

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 60

" neomake
autocmd! BufWritePost,BufReadPost *.{c,h,hs} Neomake
autocmd! VimLeave * let g:neomake_verbose = 0

" necoghc
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
