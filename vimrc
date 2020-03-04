"To Install
"   mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
"    git clone https://github.com/Shougo/dein.vim.git \
"     ~/.vim/dein/repos/github.com/Shougo/dein.vim
" :call dein#install()
"
"Update
" vi +':call dein#update()' +q

set nocompatible
filetype off

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')


"Call my original setting
source ~/.vim/vimrc.general

"Call complex plugins
source ~/.vim/vimrc.statusline
source ~/.vim/vimrc.complete
source ~/.vim/vimrc.commentify


call dein#add('vim-scripts/renamer.vim')

call dein#add('vim-scripts/yanktmp.vim')
let g:yanktmp_file = '/tmp/.' . $USER . '.vimyanktmp'
map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>

source ~/.vim/vimrc.neomake

call dein#add('thinca/vim-template')

call dein#add('rhysd/clever-f.vim')

call dein#add('Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

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


