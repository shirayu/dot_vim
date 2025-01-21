
function! BiomeFormat(ext)
    call ExecForTexts('npx', '-C ~/.vim/tools biome format --write --config-path='. $HOME .'/.vim/biome.json --stdin-file-path STDIN.' . a:ext)
endfunction

" Shift + F
autocmd myvimrc FileType javascript nnoremap <S-f> :call BiomeFormat('js')<CR>
autocmd myvimrc FileType typescript nnoremap <S-f> :call BiomeFormat('ts')<CR>
autocmd myvimrc FileType css nnoremap <S-f> :call BiomeFormat('css')<CR>


function! FormatJsonNoSort()
    call BiomeFormat('json')
endfunction
autocmd myvimrc FileType json nnoremap <S-f> :call FormatJsonNoSort()<CR>

function! FormatJson()
    call ExecForTexts('python3', '-c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=2,ensure_ascii=False,sort_keys=True))"')
    call BiomeFormat('json')
endfunction
autocmd myvimrc FileType json nnoremap <S-s> :call FormatJson()<CR>
