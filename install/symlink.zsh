#!/usr/bin/env zsh

# config
if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
fi
ln -nfs "${HOME}/dotfiles/.config/git" "${HOME}/.config/git"
ln -nfs "${HOME}/dotfiles/.config/git/.gitconfig" "${HOME}/.gitconfig"
ln -nfs "${HOME}/dotfiles/.config/gh" "${HOME}/.config/gh"

# claude
ln -nfs "${HOME}/dotfiles/.config/claude" "${HOME}/.claude"

# zshrc
if [ -f "${HOME}/.zshrc" ]; then
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
fi
ln -nfs "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
