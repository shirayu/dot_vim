
"latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to always generate a file-name.
call dein#add('https://github.com/vim-latex/vim-latex')
set grepprg=grep\ -nH\ $*

let g:Tex_FoldedSections     = ''
let g:Tex_FoldedEnvironments = ''
let g:Tex_FoldedMisc         = ''
let g:tex_flavor = 'latex'
