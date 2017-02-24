
"JavaScript
"  npm install -g eslint esformatter

NeoBundle 'millermedeiros/vim-esformatter'

if executable('esformatter')
    augroup esformatter
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.js :Esformatter
    augroup END
endif

" Shift + F for esformatter
autocmd FileType javascript nnoremap <S-f> :Esformatter<CR>
