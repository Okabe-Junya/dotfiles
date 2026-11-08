#!/usr/bin/env bash
# Type-check the mods against the API types of the installed Herdr app.
# The types are written by the app on every start and are not committed, so
# this runs only where Herdr is installed.
set -euo pipefail

cd "$(dirname "$0")/.."

home="${HERDR_APP_HOME:-${HOME}/.config/herdr-app}"
# Shipped mods get the full types, including the `herdr` module.
types="${home}/mods/spaces/gpui-kit.d.ts"
if [[ ! -f "${types}" ]]; then
  echo "typecheck: ${types} not found; start the Herdr app once to write it" >&2
  exit 1
fi

mkdir -p types
cp "${types}" types/gpui-kit.d.ts
tsc -p tsconfig.json
tsc -p tsconfig.clones.json
