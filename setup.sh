#!/usr/bin/env bash

ExistCmd() {
    echo "Checking $1"
    type "$1" || (echo "$2" && exit 1)
}

ExistCmd npm || exit 1
ExistCmd pnpm || exit 1
ExistCmd pip || exit 1
ExistCmd python || exit 1
ExistCmd vim || exit 1

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

NPM_PACKAGES="markdownlint-cli @biomejs/biome"
eval pnpm install --global "${NPM_PACKAGES}"
pnpm -g upgrade

vim -c 'CocInstall -sync coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-sh @yaegassy/coc-ruff coc-biome coc-toml' +qall
# https://github.com/neoclide/coc.nvim/issues/450#issuecomment-632498202

# coc-ruff
#  rm -rf ~/.config/coc/extensions/@yaegassy/coc-ruff-data/
#  vi '+ :CocCommand ruff.builtin.installServer' ~/a.py

(
    cd "$HOME/.config/coc/extensions/node_modules" || exit 1
    npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
)
