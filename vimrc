"To Install
"   $ vi +NeoBundleInstall +q
"To Update
"   $ vi +NeoBundleUpdate +q
"To Clean
"   $ vi +NeoBundleClean +q
"To gc
"   $ find ~/.vim/bundle -maxdepth 1 -mindepth 1 -type d -follow |  xargs -i bash -c 'cd {}; git gc'

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


"Call my original setting
source ~/.vim/vimrc.general

"Call complex plugins
source ~/.vim/vimrc.statusline
source ~/.vim/vimrc.complete
source ~/.vim/vimrc.commentify
source ~/.vim/vimrc.vimux


NeoBundle 'vim-scripts/renamer.vim'

NeoBundle 'vim-scripts/yanktmp.vim'
let g:yanktmp_file = '/tmp/.' . $USER . '.vimyanktmp'
map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>


NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }
let g:syntastic_javascript_syntax_checker = 'jshint'
let g:syntastic_tex_checkers=['lacheck', 'chktex']
map sc :call <C-u>SyntasticCheck<CR>
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_go_checkers = ['go', 'govet', 'golint']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


NeoBundle "thinca/vim-template"

NeoBundle "rhysd/clever-f.vim"

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

"Underlines the word under the cursor
NeoBundle 'itchyny/vim-cursorword'

"language specific setting
set runtimepath+=~/.vim/mine/nosql.vim/
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

call neobundle#end()


NeoBundleCheck


"Finally vim calls these
" http://mattn.kaoriya.net/software/vim/20120618123848.htm
filetype plugin on
filetype indent on


