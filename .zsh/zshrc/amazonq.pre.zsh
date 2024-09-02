#!/usr/bin/env zsh

if "${AMAZONQ_ENABLED}"; then
    [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
fi
