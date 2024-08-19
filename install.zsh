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
        sleep 1
        echo "This OS is Mac OS X!"
    fi
    if [ "$(uname -m)" != "arm64" ]; then
        echo "This Mac is Intel-based!"
        echo "This script is only for Apple Silicon"
        exit 1
    else
        sleep 1
        echo "This Mac is Apple Silicon!"
    fi
}

function clone_repository() {
    GITHUB_REPOSITORY="https://github.com/Okabe-Junya/dotfiles"
    if [ ! -d "$HOME/dotfiles" ]; then
        echo "Cloning dotfiles repository..."
        git clone "$GITHUB_REPOSITORY" "$HOME/dotfiles"
    else
        sleep 1
        echo "dotfiles repository is already cloned!"
    fi
}

function install_command_line_tools() {
    if [ ! -d "/Library/Developer/CommandLineTools" ]; then
        echo "Installing Xcode Command Line Tools..."
        xcode-select --install 2>/dev/null
    else
        sleep 1
        echo "Xcode Command Line Tools is already installed!"
    fi
}

function install_homebrew() {
    if [ ! -d "/opt/homebrew" ]; then
        echo "Installing Homebrew for Apple Silicon..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>/dev/null
    else
        sleep 1
        echo "Homebrew for Apple Silicon is already installed!"
    fi
}

function install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        sleep 1
        echo "Oh My Zsh is already installed!"
    fi
}

function initialize_symbolic_links() {
    echo "Initializing symbolic links..."
    source "./install/symlink.zsh"
}

function brew_bundle_install() {
    echo "Installing Homebrew Bundle..."
    current_dir=$(pwd)

    if [ "$NON_INTERACTIVE" = true ]; then
        echo "Skipping interactive prompt and installing Homebrew Bundle..."
        brew bundle install --file="./install/Brewfile"
    else
        echo -n "Do you want to install Homebrew Bundle? [y/n]: "
        read answer
        case $answer in
        [yY]*)
            brew bundle install --file="./install/Brewfile"
            ;;
        *)
            echo "Homebrew Bundle is not installed!"
            ;;
        esac
    fi
    cd "$current_dir"
}

function install() {
    check_os
    clone_repository
    install_command_line_tools
    install_homebrew
    install_oh_my_zsh
    brew_bundle_install

    echo "Installation is complete!"
}

install
