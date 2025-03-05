
 " vint: -ProhibitSetNoCompatible
set nocompatible
filetype off

augroup myvimrc
  autocmd!
augroup END

" Call my original setting
source ~/.vim/general.vimrc

" Dein
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

" Comment up when cleanup
"call map(dein#check_clean(), "delete(v:val, 'rf')")


" Call complex plugins and language specific setting
for f in split(glob('~/.vim/common/*') . "\n" . glob('~/.vim/lang/*.vimrc'), '\n')
    if match(f, '\.nvim\.') >= 0
         if has('nvim')
            exe 'source' f
        endif
    elseif match(f, '\.vim\.') >= 0
         if ! has('nvim')
            exe 'source' f
        endif
    else
        exe 'source' f
    endif
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
