"To Install
"   mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
"    git clone https://github.com/Shougo/dein.vim.git \
"     ~/.vim/dein/repos/github.com/Shougo/dein.vim
" :call dein#install()

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
source ~/.vim/vimrc.vimux


call dein#add('vim-scripts/renamer.vim')

call dein#add('vim-scripts/yanktmp.vim')
let g:yanktmp_file = '/tmp/.' . $USER . '.vimyanktmp'
map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>


call dein#add('neomake/neomake')
let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_tex_enabled_makers = ['lacheck', 'chktex']
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_go_enabled_makers = ['go', 'govet', 'golint']


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
source ~/.vim/lang/vimrc.latex
source ~/.vim/lang/vimrc.markdown
source ~/.vim/lang/vimrc.python
source ~/.vim/lang/vimrc.golang
source ~/.vim/lang/vimrc.cplusplus
source ~/.vim/lang/vimrc.pukiwiki
source ~/.vim/lang/vimrc.JavaScript

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


