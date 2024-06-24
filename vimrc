
 " vint: -ProhibitSetNoCompatible
set nocompatible
filetype off

if v:version < 802
    echoerr 'Too old Vim version: "' . v:version . '".'
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

" Comment up when cleanup
"call map(dein#check_clean(), "delete(v:val, 'rf')")

augroup myvimrc
  autocmd!
augroup END

"Call my original setting
source ~/.vim/vimrc.general

"Call complex plugins
source ~/.vim/vimrc.coc
source ~/.vim/vimrc.statusline
source ~/.vim/vimrc.commentify
source ~/.vim/vimrc.cursor
source ~/.vim/vimrc.yanktmp

call dein#add('vim-scripts/renamer.vim')

call dein#add('thinca/vim-template')

"Underlines the word under the cursor
call dein#add('itchyny/vim-cursorword')

"language specific setting
call dein#add('shirayu/nosql.vim')
for f in split(glob('~/.vim/lang/*'), '\n')
        exe 'source' f
endfor

augroup QfAutoCommands
  autocmd!

" Auto-close quickfix window
    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END


call dein#end()

if dein#check_install()
    call dein#install()
endif

"Finally vim calls these
" http://mattn.kaoriya.net/software/vim/20120618123848.htm
filetype plugin on
filetype indent on


