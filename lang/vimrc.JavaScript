
"JavaScript

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif




call dein#add('millermedeiros/vim-esformatter')

if executable('esformatter')
    augroup esformatter
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.js :Esformatter
    augroup END
endif

" Shift + F for esformatter
autocmd FileType javascript nnoremap <S-f> :Esformatter<CR>
