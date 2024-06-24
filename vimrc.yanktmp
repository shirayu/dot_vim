

call dein#add('vim-scripts/yanktmp.vim')
let g:yanktmp_file = '/tmp/.' . $USER . '.vimyanktmp'


if !filereadable(g:yanktmp_file)
  call writefile([], g:yanktmp_file)
  if has("unix")
    call system('chmod 600 ' . g:yanktmp_file)
  endif
endif

map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>

