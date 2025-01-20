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

    # TODO: load pnpm for ~/.vim/tools

elif [[ $1 == "update" ]]; then
    vim +':call dein#update()' +q

    # shellcheck disable=SC2016
    vim +':call dein#save_rollback("$HOME/.vim/lock/dein.lock.json.tmp")' +q

    python -c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=2,ensure_ascii=False,sort_keys=True))"  <"$HOME/.vim/lock/dein.lock.json.tmp" >"$HOME/.vim/lock/dein.lock.json"
    rm "$HOME/.vim/lock/dein.lock.json.tmp"

    pnpm -C ~/.vim/tools up --latest
else
    echo -e "\nUsage: $0 [load|update]" >&2
    exit 1
fi

COC_NODE_MODURLES_DIR="$HOME/.config/coc/extensions/node_modules"
if [[ $1 == "load" ]]; then
    (
        mkdir -p "${COC_NODE_MODURLES_DIR}"
        cd "${COC_NODE_MODURLES_DIR}" || exit 1

        # TODO: load npm for COC_NODE_MODURLES_DIR
    )
else
    (
        vim -c 'CocInstall -sync coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-sh @yaegassy/coc-ruff coc-biome coc-toml coc-go' +qall
        cd "${COC_NODE_MODURLES_DIR}" || exit 1
        npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
    )
fi

(
    DIR_VENV=~/.vim/tools/venv
    VENV_PIP="${DIR_VENV}/bin/pip"
    VENV_LOCK_FILE="$HOME/.vim/lock/coc_ruff.pip.lock.json"

    if [[ ! -e ${DIR_VENV} ]]; then
        python -m venv "${DIR_VENV}"
        "${VENV_PIP}" install ruff-lsp
    fi

    if [[ ! -e $PATH_COC_RUFF_VENV ]]; then
        mkdir -p ${PATH_COC_RUFF_DIR}
        ln -s "${DIR_VENV}" "${PATH_COC_RUFF_DIR}"
    fi

    if [[ $1 == "load" ]]; then
        python -c 'import json,sys; print(" ".join([f"{x["name"]}=={x["version"]}" for x in json.load(sys.stdin)]))' \
            <"${VENV_LOCK_FILE}" \
            | xargs -t ~/.vim/tools/venv/bin/pip install
    else
        "${VENV_PIP}" list --format freeze | cut -f1 -d= | xargs "${VENV_PIP}" install -U
        "${VENV_PIP}" list --format json | "${DIR_VENV}/bin/python" -c "import sys,json;print(json.dumps(json.loads(sys.stdin.read()),indent=2,ensure_ascii=False,sort_keys=True))" >"${VENV_LOCK_FILE}"
    fi
)
