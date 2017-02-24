

"Markdown
NeoBundleLazy 'https://github.com/kannokanno/previm', {
      \ "autoload": {
      \   "filetypes": "markdown",
      \ }}

if has('unix')
    let g:previm_open_cmd = 'google-chrome'
endif
if has('mac')
    let g:previm_open_cmd = 'open "/Applications/Google Chrome.app"'
endif
if has('win32') || has ('win64')

endif

map pv :PrevimOpen<CR>


NeoBundleLazy 'tpope/vim-markdown', {
      \ "autoload": {
      \   "filetypes": "markdown",
      \ }}

