
function! BiomeFormat(ext)
    call ExecForTexts('biome', 'format --write --stdin-file-path STDIN.' . a:ext)
endfunction

" Shift + F
autocmd myvimrc FileType javascript nnoremap <S-f> :call BiomeFormat('js')<CR>
autocmd myvimrc FileType typescript nnoremap <S-f> :call BiomeFormat('ts')<CR>
autocmd myvimrc FileType css nnoremap <S-f> :call BiomeFormat('css')<CR>


function! FormatJsonNoSort()
    call ExecForTexts('python3', '-c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=2,ensure_ascii=False))"')
endfunction
autocmd myvimrc FileType json nnoremap <S-f> :call FormatJsonNoSort()<CR>

function! FormatJson()
    call ExecForTexts('python3', '-c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=2,ensure_ascii=False,sort_keys=True))"')
endfunction
autocmd myvimrc FileType json nnoremap <S-s> :call FormatJson()<CR>
