#!/usr/bin/env zsh

# config
if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
fi
ln -nfs "${HOME}/dotfiles/.config/git" "${HOME}/.config/git"
ln -nfs "${HOME}/dotfiles/.config/git/.gitconfig" "${HOME}/.gitconfig"
ln -nfs "${HOME}/dotfiles/.config/gh" "${HOME}/.config/gh"

# zed (file-level symlink so Zed runtime artifacts under ~/.config/zed
# — prompts LMDB, future caches — don't leak into the dotfiles repo)
if [ ! -d "${HOME}/.config/zed" ]; then
    mkdir -p "${HOME}/.config/zed"
fi
ln -nfs "${HOME}/dotfiles/.config/zed/settings.json" "${HOME}/.config/zed/settings.json"

# herdr (file-level symlink so herdr runtime artifacts under ~/.config/herdr
# — sockets, logs, session state, plugin lock — don't leak into the repo)
if [ ! -d "${HOME}/.config/herdr" ]; then
    mkdir -p "${HOME}/.config/herdr"
fi
ln -nfs "${HOME}/dotfiles/.config/herdr/config.toml" "${HOME}/.config/herdr/config.toml"

# Claude Code configuration is managed separately:
# https://github.com/Okabe-Junya/claude-config
# Clone directly: git clone git@github.com:Okabe-Junya/claude-config.git ~/.claude

# zshrc
if [ -f "${HOME}/.zshrc" ] && [ ! -L "${HOME}/.zshrc" ]; then
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
fi
ln -nfs "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
