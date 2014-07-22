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
  call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim'



"Call my original setting
if filereadable(expand('~/.vim/vimrc.general'))
  source ~/.vim/vimrc.general
endif

"Call complex plugins
if filereadable(expand('~/.vim/vimrc.statusline'))
  source ~/.vim/vimrc.statusline
endif

if filereadable(expand('~/.vim/vimrc.complete'))
  source ~/.vim/vimrc.complete
endif

if filereadable(expand('~/.vim/vimrc.commentify'))
  source ~/.vim/vimrc.commentify
endif

NeoBundle 'vim-scripts/yanktmp.vim'
let g:yanktmp_file = '/tmp/.' . $USER . '.vimyanktmp'
map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>


"For python
NeoBundle 'https://github.com/rkulla/pydiction'
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict' "use Ctrl+n
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }
let g:syntastic_javascript_syntax_checker = 'jshint'
let g:syntastic_tex_checkers=['lacheck', 'chktex']
map sc :call <C-u>SyntasticCheck<CR>


"latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
set grepprg=grep\ -nH\ $*


"Markdown
NeoBundle 'https://github.com/kannokanno/previm'
let g:previm_open_cmd = 'google-chrome'
map pv :PrevimOpen<CR>
NeoBundle 'tpope/vim-markdown'

"NoSQL
set runtimepath+=~/.vim/mine/nosql.vim/


if filereadable(expand('~/.vim/vimrc.golang'))
  source ~/.vim/vimrc.golang
endif


NeoBundleCheck


"Finally vim calls these
" http://mattn.kaoriya.net/software/vim/20120618123848.htm
filetype plugin on
filetype indent on
