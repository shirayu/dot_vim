set encoding=utf-8
scriptencoding utf-8

"show numbers
set number

"not show the message
set shortmess+=I

"no history
let g:netrw_dirhistmax = 0

"encoding
set fileencoding=utf-8	"to
set fileencodings=utf-8,euc-jp,shift-jis,iso-2022-jp,utf-16	"from

"do not stop cursor at Begin and end of line
set whichwrap=b,s,h,l,<,>,[,]

"type F3 toggles paste mode
set pastetoggle=<F3>

"set color
if has('nvim')
  colorscheme vim
else
  set background=dark
endif
set foldlevel=100 "Don't autofold anything
set nofoldenable

"unnecessary files
set noswapfile
set viminfo=
set nowritebackup
set nobackup

set autoindent smartindent tabstop=8 expandtab shiftwidth=4 softtabstop=4

set spelllang=en,cjk
set spell
"Triple <ESC> hit makes no spell
nmap <Esc><Esc><Esc> :set nospell<CR><Esc>

set ignorecase  " 大文字小文字を区別しない
set smartcase   " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch   " インクリメンタルサーチ
set hlsearch    " 検索マッチテキストをハイライト
set showmatch           " 対応する括弧などをハイライト表示する
set matchpairs& matchpairs+=<:> "対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start " バックスペースでせるようにする
set nf="" " 0padding like 003 -> Decimal number not octal number

"no bells
set t_vb=
set novisualbell

syntax on

"swig
au myvimrc BufNewFile,BufRead *.i set filetype=swig
au myvimrc BufNewFile,BufRead *.swg set filetype=swig

"wdiff
au myvimrc BufNewFile,BufRead *.wdiff set filetype=wdiff
autocmd myvimrc FileType wdiff hi Special    cterm=None ctermfg=Red
autocmd myvimrc FileType wdiff hi Identifier cterm=None ctermfg=Green

"show underline
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline guifg=NONE guibg=NONE

"Double <ESC> hit makes the highlight disable
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"Fix Key
" http://vim.wikia.com/wiki/GNU_Screen_integration
map [1~ <Home>
map [4~ <End>
map OF <End>
imap [1~ <Home>
imap [4~ <End>
imap OF <End>

" Disable Ctrl-z (suspend)
" https://vi.stackexchange.com/a/9833
nnoremap <c-z> <nop>


" search with * in visual mode
vnoremap * "zy:let @/ = @z<CR>n

" Checking typo. Warn if the file name starts with : or ends with [ or ]
" http://d.hatena.ne.jp/hyuki/20140211/vim
autocmd myvimrc BufWriteCmd :*,*[,*] call s:write_check_typo(expand('<afile>'))
function! s:write_check_typo(file)
    let prompt = "possible typo: really want to write to '" . a:file . "'?(y/n):"
    let input = input(prompt)
    if input =~? '^y\(es\)\=$'
        execute 'write'.(v:cmdbang ? '!' : '') a:file
    endif
endfunction


"Fix ambiwidth
set ambiwidth=double

"No mounse
set mouse-=a


" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction


" NFKC normalization
function! Nfkc()
    "E501 line break
    call Preserve(':silent %!perl -CSD -e ''use Unicode::Normalize;while ($line = <STDIN>){print NFKC($line)}'' ')
endfunction
command! Nfkc :call Nfkc()


function! ExecForTexts(command, args)
    if executable(a:command)
        call Preserve(':silent %!' . a:command . ' ' . a:args)
    else
        echohl ErrorMsg | echo a:command . ' not installed!' | echohl None
    endif
endfunction
