#!/usr/bin/env zsh

ZSH_CONFIG_DIR="~/dotfiles/.zsh/zshrc"
ls -l "${ZSH_CONFIG_DIR}"

# Load source files
source "${ZSH_CONFIG_DIR}/alias.zsh"
source "${ZSH_CONFIG_DIR}/arch.zsh"
source "${ZSH_CONFIG_DIR}/export.zsh"
source "${ZSH_CONFIG_DIR}/starship.zsh"
source "${ZSH_CONFIG_DIR}/virtualenv.zsh"
