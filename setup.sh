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
        TAGERT=$(echo \
            coc-markdownlint \
            coc-diagnostic \
            coc-css \
            coc-json \
            coc-yaml \
            coc-texlab \
            coc-pyright \
            coc-tsserver \
            coc-sh \
            @yaegassy/coc-ruff \
            coc-biome \
            coc-toml \
            coc-go)
        vim -c "CocInstall -sync ${TAGERT}" +qall
        cd "${COC_NODE_MODURLES_DIR}" || exit 1
        npm list --json >"$HOME/.vim/lock/coc.package.lock.json"
    )
fi
