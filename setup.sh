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

PATH_COC_RUFF_DIR=~/.config/coc/extensions/@yaegassy/coc-ruff-data/ruff-lsp
PATH_COC_RUFF_VENV=${PATH_COC_RUFF_DIR}/venv
if [[ -e $PATH_COC_RUFF_VENV && ! -L $PATH_COC_RUFF_VENV ]]; then
    echo "Error: $PATH_COC_RUFF_VENV exists and is not a symbolic link." >&2
    exit 1
fi

if [[ $1 == "load" ]]; then
    vim +':call dein#load_rollback(expand("~/.vim/lock/dein.lock.json"))' +q

    xargs -t pip install <"$HOME/.vim/lock/pip.lock.txt"

elif [[ $1 == "update" ]]; then
    vim +':call dein#update()' +q

    # shellcheck disable=SC2016
    vim +':call dein#save_rollback("$HOME/.vim/lock/dein.lock.json.tmp")' +q

    python -m json.tool <"$HOME/.vim/lock/dein.lock.json.tmp" >"$HOME/.vim/lock/dein.lock.json"
    rm "$HOME/.vim/lock/dein.lock.json.tmp"

    pnpm -C ~/.vim/tools up --latest
else
    echo -e "\nUsage: $0 [load|update]" >&2
    exit 1
fi

vim -c 'CocInstall -sync coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-sh @yaegassy/coc-ruff coc-biome coc-toml coc-go' +qall
# https://github.com/neoclide/coc.nvim/issues/450#issuecomment-632498202

(
    DIR_VENV=~/.vim/tools/venv

    if [[ ! -e ${DIR_VENV} ]]; then
        python -m venv "${DIR_VENV}"
        "${DIR_VENV}/bin/pip" install ruff-lsp
    fi

    if [[ ! -e $PATH_COC_RUFF_VENV ]]; then
        mkdir -p ${PATH_COC_RUFF_DIR}
        ln -s "${DIR_VENV}" "${PATH_COC_RUFF_DIR}"
    fi

    "${DIR_VENV}/bin/pip" list --format freeze | cut -f1 -d= | xargs "${DIR_VENV}/bin/pip" install -U
    "${DIR_VENV}/bin/pip" list --format json | "${DIR_VENV}/bin/python" -m json.tool >"$HOME/.vim/lock/coc_ruff.pip.lock.json"
)

(
    cd "$HOME/.config/coc/extensions/node_modules" || exit 1
    npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
)
