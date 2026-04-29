#!/usr/bin/env zsh

if [[ "${KIRO_ENABLED}" == "true" ]]; then
    [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
fi
