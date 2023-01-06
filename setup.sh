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
    vim +':call dein#load_rollback(expand("~/.vim/dein.lock.json"))' +q
elif [[ $1 == "update" ]]; then
    vim +':call dein#update()' +q
    vim +':call dein#save_rollback("$HOME/.vim/dein.lock.json.tmp")' +q
    python -m json.tool <"$HOME/.vim/dein.lock.json.tmp" >"$HOME/.vim/dein.lock.json"
    rm "$HOME/.vim/dein.lock.json.tmp"
else
    echo "Usage: $0 [load|update]" >&2
    exit 1
fi

pip install -U isort black
npm update --location=global markdownlint-cli esformatter eslint js-beautify
vim -c \
    'CocInstall coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-prettier'
