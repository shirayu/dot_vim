#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

TMPDIR=$(mktemp -d)
trap 'rm -rf "${TMPDIR}"' EXIT INT TERM HUP

FOO=${FOO:-"DEFAULT_VALUE"}
BAR=${BAR:?No value is gien for BAR}
