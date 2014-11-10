"To Install
"   $ vi +NeoBundleInstall +q
"To Update
"   $ vi +NeoBundleUpdate +q
"To Clean
"   $ vi +NeoBundleClean +q

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif


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


"language specific setting
set runtimepath+=~/.vim/mine/nosql.vim/
source ~/.vim/lang/vimrc.latex
source ~/.vim/lang/vimrc.markdown
source ~/.vim/lang/vimrc.python
source ~/.vim/lang/vimrc.golang


NeoBundleCheck


"Finally vim calls these
" http://mattn.kaoriya.net/software/vim/20120618123848.htm
filetype plugin on
filetype indent on
