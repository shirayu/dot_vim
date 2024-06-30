
call dein#add('shirayu/nosql.vim')

call dein#add('kyoh86/vim-jsonl')
au BufRead,BufNewFile *.jsonl set filetype=jsonl
au BufRead,BufNewFile *.jsons set filetype=jsonl

