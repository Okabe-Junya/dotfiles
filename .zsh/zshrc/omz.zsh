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

source $ZSH/oh-my-zsh.sh
