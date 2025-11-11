#!/usr/bin/env zsh

# Determine the dotfiles directory (absolute path)
SCRIPT_DIR="${0:a:h}"
DOTFILES_DIR="${SCRIPT_DIR:h}"

echo "Using dotfiles directory: $DOTFILES_DIR"

# Create .config directory if it doesn't exist
if [ ! -d "${HOME}/.config" ]; then
    echo "Creating ${HOME}/.config directory..."
    mkdir -p "${HOME}/.config"
fi

# Link .config/git
if [ -d "${DOTFILES_DIR}/.config/git" ]; then
    echo "Linking git config..."
    ln -nfs "${DOTFILES_DIR}/.config/git" "${HOME}/.config/git"
    ln -nfs "${DOTFILES_DIR}/.config/git/.gitconfig" "${HOME}/.gitconfig"
else
    echo "Warning: git config not found at ${DOTFILES_DIR}/.config/git"
fi

# Link .config/gh
if [ -d "${DOTFILES_DIR}/.config/gh" ]; then
    echo "Linking gh config..."
    ln -nfs "${DOTFILES_DIR}/.config/gh" "${HOME}/.config/gh"
else
    echo "Warning: gh config not found at ${DOTFILES_DIR}/.config/gh"
fi

# Backup existing .zshrc and create new symlink
if [ -f "${HOME}/.zshrc" ] && [ ! -L "${HOME}/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak..."
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
fi

if [ -f "${DOTFILES_DIR}/.zshrc" ]; then
    echo "Linking .zshrc..."
    ln -nfs "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
else
    echo "Warning: .zshrc not found at ${DOTFILES_DIR}/.zshrc"
fi

echo "Symbolic links created successfully!"
