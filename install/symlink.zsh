#!/usr/bin/env zsh

# config
if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
fi
ln -nfs "${HOME}/dotfiles/.config/git" "${HOME}/.config/git"
ln -nfs "${HOME}/dotfiles/.config/git/.gitconfig" "${HOME}/.gitconfig"
ln -nfs "${HOME}/dotfiles/.config/gh" "${HOME}/.config/gh"

# claude code (~/.claude/)
# Claude Code uses ~/.claude/ as its config directory
if [ ! -d "${HOME}/.claude" ]; then
    mkdir -p "${HOME}/.claude"
fi
# settings.json - global settings
ln -nfs "${HOME}/dotfiles/.config/claude/settings.json" "${HOME}/.claude/settings.json"
# CLAUDE.md - global instructions (memory file)
ln -nfs "${HOME}/dotfiles/.config/claude/CLAUDE.md" "${HOME}/.claude/CLAUDE.md"
# agents/ - sub-agents for specialized tasks
ln -nfs "${HOME}/dotfiles/.config/claude/agents" "${HOME}/.claude/agents"

# zshrc
if [ -f "${HOME}/.zshrc" ]; then
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
fi
ln -nfs "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
