
"JavaScript

function! Js_beautify()
"    let now_line = line(".")
"    exec ":%! js-beautify -f - "
"    exec ":" . now_line
    call Preserve(':silent %!js-beautify -f -')
endfunction

if executable('js-beautify')
    augroup js_beautify
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.js call Js_beautify()
    augroup END
endif

" Shift + F for js_beautify
autocmd FileType javascript nnoremap <S-f> :call Js_beautify()<CR>

