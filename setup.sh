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

    pnpm -C ~/.vim/tools install

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

COC_NODE_MODURLES_DIR="$HOME/.config/coc/extensions"
if [[ $1 == "load" ]]; then
    (
        mkdir -p "${COC_NODE_MODURLES_DIR}"
        cp "$HOME/.vim/lock/coc.package.json" "${COC_NODE_MODURLES_DIR}/package.json" 
        cp "$HOME/.vim/lock/coc.package-lock.json" "${COC_NODE_MODURLES_DIR}/package-lock.json" 
        npm i -C "${COC_NODE_MODURLES_DIR}"
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
        npm i --package-lock-only -C "${COC_NODE_MODURLES_DIR}"
        cp "${COC_NODE_MODURLES_DIR}/package.json" "$HOME/.vim/lock/coc.package.json"
        cp "${COC_NODE_MODURLES_DIR}/package-lock.json" "$HOME/.vim/lock/coc.package-lock.json"
    )
fi
