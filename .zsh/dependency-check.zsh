#!/usr/bin/env zsh

set -euo pipefail

function check_homebrew() {
    if [ ! -d "/opt/homebrew" ]; then
        echo "Homebrew is not installed!"
        echo "Please install Homebrew first!"
        exit 1
    else
        sleep 1
        echo "Homebrew is already installed!"
    fi
}

function check_lsd() {
    if ! command -v lsd 1>/dev/null 2>&1; then
        echo "lsd is not installed!"
        echo "Please install lsd first!"
        exit 1
    else
        sleep 1
        echo "lsd is already installed!"
    fi
}

function check_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh is not installed!"
        echo "Please install Oh My Zsh first!"
        exit 1
    else
        sleep 1
        echo "Oh My Zsh is already installed!"
    fi
}

function main() {
    check_homebrew
    check_lsd
    check_oh_my_zsh

    echo "All dependencies are installed!"
}

main
