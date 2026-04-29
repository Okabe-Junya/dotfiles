#!/usr/bin/env zsh

set -euo pipefail

NON_INTERACTIVE=false

for arg in "$@"; do
    if [ "$arg" = "--non-interactive" ]; then
        NON_INTERACTIVE=true
        break
    fi
done

function check_os() {
    if [ "$(uname)" != "Darwin" ]; then
        echo "This script is only for Mac OS X"
        exit 1
    else
        echo "This OS is Mac OS X!"
    fi
    if [ "$(uname -m)" != "arm64" ]; then
        echo "This Mac is Intel-based!"
        echo "This script is only for Apple Silicon"
        exit 1
    else
        echo "This Mac is Apple Silicon!"
    fi
}

function install_homebrew() {
    if [ ! -d "/opt/homebrew" ]; then
        echo "Installing Homebrew for Apple Silicon..."
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew for Apple Silicon is already installed!"
    fi
    # Ensure brew is available in the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

function clone_repository() {
    if [ ! -d "$HOME/dotfiles" ]; then
        echo "Cloning dotfiles repository..."
        git clone "https://github.com/Okabe-Junya/dotfiles" "$HOME/dotfiles"
    else
        echo "dotfiles repository is already cloned!"
    fi
}

function install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        # --unattended: skip changing default shell and running zsh after install
        # --keep-zshrc: do not overwrite existing .zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
    else
        echo "Oh My Zsh is already installed!"
    fi
}

function brew_bundle_install() {
    echo "Installing Homebrew Bundle..."
    if [ "$NON_INTERACTIVE" = true ]; then
        echo "Skipping interactive prompt and installing Homebrew Bundle..."
        brew bundle install --file="$HOME/dotfiles/install/Brewfile"
    else
        echo -n "Do you want to install Homebrew Bundle? [y/n]: "
        read answer
        case $answer in
        [yY]*)
            brew bundle install --file="$HOME/dotfiles/install/Brewfile"
            ;;
        *)
            echo "Homebrew Bundle is not installed!"
            ;;
        esac
    fi
}

function initialize_symbolic_links() {
    echo "Initializing symbolic links..."
    source "$HOME/dotfiles/install/symlink.zsh"
}

function install() {
    check_os
    install_homebrew
    clone_repository
    brew_bundle_install
    install_oh_my_zsh
    initialize_symbolic_links

    echo "Installation is complete!"
}

install
