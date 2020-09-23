#!/usr/bin/env bash

if [[ -n $ZSH_VERSION ]]; then
    emulate -R ksh
    set -o BSD_ECHO
fi

set -e

unset tmpfile

atexit() {
    [[ -n ${tmpfile-} ]] && rm -f "$tmpfile"
}

trap atexit EXIT
trap 'rc=$?; trap - EXIT; atexit; exit $?' INT PIPE TERM

tmpfile=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX")

CONFIG_ARG=""
if [ -f '.markdownlint.json' ]; then
    CONFIG_ARG="-c .markdownlint.json"
elif [ -f "${HOME}/.markdownlint.json" ]; then
    CONFIG_ARG="-c ${HOME}/.markdownlint.json"
fi

cat - >"$tmpfile"
eval "markdownlint -f ${tmpfile} ${CONFIG_ARG}" 2>/dev/null || :
cat "$tmpfile"
