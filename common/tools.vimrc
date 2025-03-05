

call dein#add('qpkorr/vim-renamer')

" Temttn/vim-sonictemplate'plate
call dein#add('mattn/vim-sonictemplate')
let g:sonictemplate_vim_template_dir = [expand('~/.vim/template')]

" Underlines the word under the cursor
call dein#add('itchyny/vim-cursorword')


if has('nvim')
    " 行番号入力中にリアルタイムに表示
    call dein#add('nacro90/numb.nvim')
    :lua require('numb').setup()

endif
