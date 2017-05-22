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


NeoBundle 'neomake/neomake'
let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_tex_enabled_makers = ['lacheck', 'chktex']
let g:neomake_cpp_eslint_maker = {
    \ 'exe': 'clang++',
    \ 'args': ['-std=c++11 -stdlib=libc++', '-I', $HOME . "/local/llvm/include1", '-I', $HOME . "/local/llvm/include2"]
    \ }
let g:neomake_go_enabled_makers = ['go', 'govet', 'golint']


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
NeoBundle 'shirayu/nosql.vim'
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


