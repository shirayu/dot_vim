#!/usr/bin/env bash

ExistCmd() {
    echo "Checking $1"
    type "$1"
}

ExistCmd npm || exit 1
ExistCmd pip || exit 1
ExistCmd python || exit 1
ExistCmd vim || exit 1

if [[ $1 == "load" ]]; then
    vi +':call dein#load_rollback(expand("~/.vim/dein.lock"))' +q
else
    vi +':call dein#update()' +q
    vi +':call dein#save_rollback("$HOME/.vim/dein.lock.tmp")' +q
    python -m json.tool <"$HOME/.vim/dein.lock.tmp" >"$HOME/.vim/dein.lock"
    rm "$HOME/.vim/dein.lock.tmp"
fi

pip install -U isort black
npm update --location=global markdownlint-cli esformatter eslint js-beautify
vim -c \
    'CocInstall coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-prettier'
