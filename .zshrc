#!/usr/bin/env zsh

ZSH_CONFIG_DIR="${HOME}/dotfiles/.zsh/zshrc"
AMAZONQ_ENABLED=true

# Load source files
source "${ZSH_CONFIG_DIR}/arch.zsh"
source "${ZSH_CONFIG_DIR}/export.zsh"
source "${ZSH_CONFIG_DIR}/virtualenv.zsh"
source "${ZSH_CONFIG_DIR}/omz.zsh"
source "${ZSH_CONFIG_DIR}/alias.zsh"
