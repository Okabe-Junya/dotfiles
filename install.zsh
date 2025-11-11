#!/usr/bin/env zsh

set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

NON_INTERACTIVE=false
DOTFILES_DIR="$HOME/dotfiles"

for arg in "$@"; do
    if [ "$arg" = "--non-interactive" ]; then
        NON_INTERACTIVE=true
        break
    fi
done

# Logging functions
function log_info() {
    echo "${GREEN}[INFO]${NC} $1"
}

function log_warn() {
    echo "${YELLOW}[WARN]${NC} $1"
}

function log_error() {
    echo "${RED}[ERROR]${NC} $1"
}

function log_success() {
    echo "${GREEN}[SUCCESS]${NC} $1"
}

# Setup Homebrew environment
function setup_homebrew_env() {
    if [ -f "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        log_info "Homebrew environment configured"
    fi
}

function check_os() {
    log_info "Checking operating system..."
    if [ "$(uname)" != "Darwin" ]; then
        log_error "This script is only for macOS"
        exit 1
    fi
    log_success "Running on macOS"

    if [ "$(uname -m)" != "arm64" ]; then
        log_error "This script is only for Apple Silicon (ARM64)"
        log_error "Detected architecture: $(uname -m)"
        exit 1
    fi
    log_success "Running on Apple Silicon"
}

function clone_repository() {
    local GITHUB_REPOSITORY="https://github.com/Okabe-Junya/dotfiles"

    if [ ! -d "$DOTFILES_DIR" ]; then
        log_info "Cloning dotfiles repository..."
        if git clone "$GITHUB_REPOSITORY" "$DOTFILES_DIR"; then
            log_success "Dotfiles repository cloned successfully"
        else
            log_error "Failed to clone dotfiles repository"
            exit 1
        fi
    else
        log_warn "Dotfiles repository already exists at $DOTFILES_DIR"
        log_info "Pulling latest changes..."
        cd "$DOTFILES_DIR"
        if git pull; then
            log_success "Repository updated"
        else
            log_warn "Failed to update repository, continuing with existing version"
        fi
    fi
}

function install_command_line_tools() {
    log_info "Checking Xcode Command Line Tools..."

    if ! xcode-select -p &>/dev/null; then
        log_info "Installing Xcode Command Line Tools..."
        log_warn "A dialog will appear. Please follow the installation instructions."

        if xcode-select --install 2>/dev/null; then
            log_info "Waiting for Xcode Command Line Tools installation to complete..."
            log_info "This may take several minutes. Please wait..."

            # Wait for installation to complete
            until xcode-select -p &>/dev/null; do
                sleep 5
            done
            log_success "Xcode Command Line Tools installed successfully"
        else
            log_error "Failed to install Xcode Command Line Tools"
            exit 1
        fi
    else
        log_success "Xcode Command Line Tools already installed"
    fi
}

function install_homebrew() {
    log_info "Checking Homebrew installation..."

    if [ ! -d "/opt/homebrew" ]; then
        log_info "Installing Homebrew for Apple Silicon..."
        log_warn "This will require sudo password"

        if NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
            log_success "Homebrew installed successfully"
            # Setup PATH immediately after installation
            setup_homebrew_env
        else
            log_error "Failed to install Homebrew"
            exit 1
        fi
    else
        log_success "Homebrew already installed"
        setup_homebrew_env
    fi

    # Verify brew command is available
    if ! command -v brew &>/dev/null; then
        log_error "brew command not found in PATH after installation"
        log_info "Please add the following to your shell profile:"
        log_info 'eval "$(/opt/homebrew/bin/brew shellenv)"'
        exit 1
    fi

    log_info "Updating Homebrew..."
    if brew update; then
        log_success "Homebrew updated"
    else
        log_warn "Failed to update Homebrew, continuing anyway"
    fi
}

function install_oh_my_zsh() {
    log_info "Checking Oh My Zsh installation..."

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log_info "Installing Oh My Zsh..."

        # Install Oh My Zsh in non-interactive mode
        if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; then
            log_success "Oh My Zsh installed successfully"

            # Oh My Zsh creates a default .zshrc, remove it to use our own
            if [ -f "$HOME/.zshrc" ]; then
                log_info "Removing Oh My Zsh default .zshrc..."
                rm -f "$HOME/.zshrc"
                log_info "Will use dotfiles .zshrc instead"
            fi
        else
            log_error "Failed to install Oh My Zsh"
            exit 1
        fi
    else
        log_success "Oh My Zsh already installed"
    fi
}

function initialize_symbolic_links() {
    log_info "Initializing symbolic links..."

    local symlink_script="$DOTFILES_DIR/install/symlink.zsh"
    if [ ! -f "$symlink_script" ]; then
        log_error "Symlink script not found at $symlink_script"
        exit 1
    fi

    cd "$DOTFILES_DIR"
    if source "$symlink_script"; then
        log_success "Symbolic links created successfully"
    else
        log_error "Failed to create symbolic links"
        exit 1
    fi
}

function brew_bundle_install() {
    log_info "Preparing to install Homebrew packages..."

    local brewfile="$DOTFILES_DIR/install/Brewfile"
    if [ ! -f "$brewfile" ]; then
        log_error "Brewfile not found at $brewfile"
        exit 1
    fi

    # Ensure brew command is available
    if ! command -v brew &>/dev/null; then
        log_error "brew command not found. Please ensure Homebrew is installed correctly."
        exit 1
    fi

    local should_install=false
    if [ "$NON_INTERACTIVE" = true ]; then
        log_info "Non-interactive mode: Installing Homebrew packages..."
        should_install=true
    else
        echo -n "Do you want to install Homebrew packages? This may take a while. [y/n]: "
        read answer
        case $answer in
        [yY]*)
            should_install=true
            ;;
        *)
            log_warn "Skipping Homebrew package installation"
            return 0
            ;;
        esac
    fi

    if [ "$should_install" = true ]; then
        log_info "Installing packages from Brewfile..."
        log_info "This may take several minutes depending on your internet connection..."

        if brew bundle install --file="$brewfile" --no-lock; then
            log_success "Homebrew packages installed successfully"
        else
            log_error "Some packages failed to install"
            log_warn "You can run 'brew bundle install --file=$brewfile' manually later"
            return 1
        fi
    fi
}

function install() {
    echo ""
    log_info "========================================="
    log_info "Starting dotfiles installation"
    log_info "========================================="
    echo ""

    check_os
    echo ""

    clone_repository
    echo ""

    install_command_line_tools
    echo ""

    install_homebrew
    echo ""

    install_oh_my_zsh
    echo ""

    brew_bundle_install
    echo ""

    initialize_symbolic_links
    echo ""

    log_info "========================================="
    log_success "Installation completed successfully!"
    log_info "========================================="
    echo ""
    log_info "Please restart your terminal or run: source ~/.zshrc"
}

# Main execution
install
