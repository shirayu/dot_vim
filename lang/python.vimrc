
"For python

autocmd myvimrc FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" To use .venv/bin/ruff in coc-ruff
if expand('%:e') ==# 'py'
    let dir = expand('%:p:h')
    while dir !=# '/' && !empty(dir)
        let venv_bin = dir . '/.venv/bin'
        if isdirectory(venv_bin)
            let $PATH = venv_bin . ':' . $PATH
            call setenv('PATH', $PATH)
            break
        endif
        let dir = fnamemodify(dir, ':h')
    endwhile
endif

function! FormatPython()
    " If coc is not ready, this raises an error
    CocCommand ruff.executeFormat
    CocCommand ruff.executeOrganizeImports
    CocCommand ruff.executeAutofix
endfunction

" Shift + F for FormatPython
autocmd myvimrc FileType python nnoremap <S-f> :call FormatPython()<CR>

" https://github.com/neoclide/coc.nvim/issues/3441#issuecomment-949255590
aug python
  au!
  au BufWrite *.py call FormatPython()
aug END
