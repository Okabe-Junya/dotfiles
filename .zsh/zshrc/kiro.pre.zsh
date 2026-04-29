#!/usr/bin/env zsh

if [[ "${KIRO_ENABLED}" == "true" ]]; then
    [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
fi
