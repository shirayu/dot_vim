
let s:script_dir = expand('<sfile>:p:h')

"Markdown
call dein#add('https://github.com/kannokanno/previm', {
      \ 'lazy' : 1,
      \ 'autoload': {
      \   'filetypes': 'markdown',
      \ }})

if has('unix')
    let g:previm_open_cmd = 'google-chrome'
endif
if has('mac')
    let g:previm_open_cmd = 'open "/Applications/Google Chrome.app"'
endif
if has('win32') || has ('win64')

endif

map pv :PrevimOpen<CR>


call dein#add('tpope/vim-markdown', {
      \ 'lazy' : 1,
      \ 'autoload': {
      \   'filetypes': 'markdown',
      \ }})


function! FixMd()
    call ExecForTexts('bash', s:script_dir . '/markdownfix.bash')
endfunction
autocmd myvimrc FileType markdown nnoremap <S-f> :call FixMd()<CR>
