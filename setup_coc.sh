#!/usr/bin/env bash

pip install -U isort black
vim -c \
    'CocInstall coc-markdownlint coc-diagnostic coc-css coc-htmlhint coc-eslint coc-json coc-yaml coc-texlab coc-pyright coc-tsserver coc-prettier'
