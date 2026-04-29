#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    argocd
    aws
    cp
    fzf
    gcloud
    gh
    kubectx
    macos
    ssh
)

# Add Homebrew completions to FPATH before loading Oh My Zsh
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

source $ZSH/oh-my-zsh.sh
