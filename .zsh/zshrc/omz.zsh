#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    argocd
    git
    bundler
    macos
    rake
    rbenv
    ruby
    aws
    cp
    fzf
    gcloud
    gh
    golang
    helm
    history
    kind
    kubectl
    kubectx
    rails
    ssh
)

# Add Homebrew completions to FPATH before loading Oh My Zsh
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh
