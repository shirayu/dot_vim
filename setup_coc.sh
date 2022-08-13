#!/usr/bin/env bash

ExistCmd() { echo "Checking $1" ; type "$1"; }

ExistCmd pip || exit 1
ExistCmd npm || exit 1

pip install -U isort black
npm update --location=global markdownlint-cli esformatter eslint js-beautify
vim -c \
    'CocInstall coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-prettier'
