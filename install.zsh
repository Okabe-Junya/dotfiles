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

function initialize_symbolic_links() {
    echo "Initializing symbolic links..."
    source "./install/symlink.zsh"
}

function brew_bundle_install() {
    echo "Installing Homebrew Bundle..."
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
}

function install() {
    check_os
    install_command_line_tools
    install_homebrew
    brew_bundle_install

    echo "Installation is complete!"
}

install
