setlocal formatprg=hindent\ --line-length\ 80
nnoremap <Leader>mt :GhcModType<CR>
nnoremap <Leader>mT :GhcModTypeInsert<CR>
nnoremap <Leader>mc :GhcModTypeClear<CR>
nnoremap <Leader>ms :GhcModSplitFunCase<CR>
nnoremap <Leader>ml :GhcModLintAsync<CR>

" autocmd! BufWritePost *.hs GhcModCheckAndLintAsync

let g:necoghc_enable_detailed_browse = 1
