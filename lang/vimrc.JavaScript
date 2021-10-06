
"JavaScript

function! FormatJavaScript()
    call ExecForTexts('esformatter', '/dev/stdin')
endfunction

" Shift + F for esformatter
autocmd myvimrc FileType javascript nnoremap <S-f> :call FormatJavaScript()<CR>


function! FormatJson()
    call ExecForTexts('python3', '-c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=4,ensure_ascii=False,sort_keys=True))"')
endfunction
autocmd myvimrc FileType json nnoremap <S-f> :call FormatJson()<CR>


function! FormatHtml()
    call ExecForTexts('html-beautify', '')
endfunction
autocmd myvimrc FileType html nnoremap <S-f> :call FormatHtml()<CR>

function! FormatCss()
    call ExecForTexts('css-beautify', '')
endfunction
autocmd myvimrc FileType css nnoremap <S-f> :call FormatCss()<CR>
