#!/usr/bin/env bash

ExistCmd() {
    echo "Checking $1"
    type "$1" || (echo "$2" && exit 1)
}

ExistCmd npm || exit 1
ExistCmd pip || exit 1
ExistCmd python || exit 1
ExistCmd vim || exit 1
ExistCmd yarn "Install: npm i --global yarn" || exit 1 # For coc-vim

if [[ $1 == "load" ]]; then
    vim +':call dein#load_rollback(expand("~/.vim/lock/dein.lock.json"))' +q

    xargs -t pip install <"$HOME/.vim/lock/pip.lock.txt"

elif [[ $1 == "update" ]]; then
    vim +':call dein#update()' +q
    vim +':call dein#save_rollback("$HOME/.vim/lock/dein.lock.json.tmp")' +q
    python -m json.tool <"$HOME/.vim/lock/dein.lock.json.tmp" >"$HOME/.vim/lock/dein.lock.json"
    rm "$HOME/.vim/lock/dein.lock.json.tmp"

else
    echo -e "\nUsage: $0 [load|update]" >&2
    exit 1
fi

NPM_PACKAGES="markdownlint-cli eslint"
eval npm install --location=global "${NPM_PACKAGES}"
eval npm update --location=global "${NPM_PACKAGES}"
eval npm list -g --json "${NPM_PACKAGES}" >"$HOME/.vim/lock/npm_global.package.lock.json"

vim -c 'CocInstall -sync coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-sh coc-prettier @yaegassy/coc-ruff' +qall
# https://github.com/neoclide/coc.nvim/issues/450#issuecomment-632498202

# Running ":CocCommand ruff.builtin.installServer" may be needed after update coc-ruff
# Any problem? : Clean ~/.config/coc/extensions/@yaegassy/coc-ruff-data/ruff-lsp/venv/ and re-run
# https://github.com/shirayu/coc-ruff?tab=readme-ov-file#bult-in-install

(
    cd "$HOME/.config/coc/extensions/node_modules" || exit 1
    npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
    ~/.config/coc/extensions/@yaegassy/coc-ruff-data/ruff-lsp/venv/bin/pip list --disable-pip-version-check | grep -e 'ruff' | perl -pe 's/\s+/==/' >"$HOME/.vim/lock/pip.lock.txt"
)
