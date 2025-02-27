
" Shift + F
autocmd myvimrc FileType sh,zsh,csh nnoremap <S-f> :call ExecForTexts('shfmt', '-i 4 -ci -bn -s')<CR>

autocmd myvimrc BufNewFile *.*sh Template default
