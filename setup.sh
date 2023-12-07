#!/usr/bin/env bash

ExistCmd() {
    echo "Checking $1"
    type "$1" || (echo "$2" && exit 1)
}

ExistCmd npm || exit 1
ExistCmd pip || exit 1
ExistCmd python || exit 1
ExistCmd vim || exit 1
ExistCmd yarn "Install: npm i --global yarn && asdf reshim" || exit 1 # For coc-vim

if [[ $1 == "load" ]]; then
    vim +':call dein#load_rollback(expand("~/.vim/lock/dein.lock.json"))' +q

    xargs -t pip install <"$HOME/.vim/lock/pip.lock.txt"

elif [[ $1 == "update" ]]; then
    vim +':call dein#update()' +q
    vim +':call dein#save_rollback("$HOME/.vim/lock/dein.lock.json.tmp")' +q
    python -m json.tool <"$HOME/.vim/lock/dein.lock.json.tmp" >"$HOME/.vim/lock/dein.lock.json"
    rm "$HOME/.vim/lock/dein.lock.json.tmp"

    pip install -U isort black flake8
    pip list --disable-pip-version-check | grep -e 'isort' -e 'black' -e 'flake8' | perl -pe 's/\s+/==/' >"$HOME/.vim/lock/pip.lock.txt"
else
    echo -e "\nUsage: $0 [load|update]" >&2
    exit 1
fi

NPM_PACKAGES="markdownlint-cli esformatter eslint js-beautify"
eval npm install --location=global "${NPM_PACKAGES}"
eval npm update --location=global "${NPM_PACKAGES}"
asdf reshim
eval npm list -g --json "${NPM_PACKAGES}" >"$HOME/.vim/lock/npm_global.package.lock.json"

vim -c \
    'CocInstall coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-prettier'
(
    cd "$HOME/.config/coc/extensions/node_modules" || exit 1
    npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
)
