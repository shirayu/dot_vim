
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

" Shift + F for esformatter
autocmd FileType javascript nnoremap <S-f> :Esformatter<CR>


function! FormatJson()
    call ExecForTexts('python3', '-c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=4,ensure_ascii=False,sort_keys=True))"')
endfunction
autocmd FileType json nnoremap <S-f> :call FormatJson()<CR>


function! FormatHtml()
    call ExecForTexts('html-beautify', '')
endfunction
autocmd FileType html nnoremap <S-f> :call FormatHtml()<CR>

function! FormatCss()
    call ExecForTexts('css-beautify', '')
endfunction
autocmd FileType css nnoremap <S-f> :call FormatCss()<CR>
