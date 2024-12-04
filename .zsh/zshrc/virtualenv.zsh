#!/usr/bin/env zsh

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
if command -v nodenv 1>/dev/null 2>&1; then
    eval "$(nodenv init -)"
fi
if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi
if command -v direnv 1>/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi
if command -v rye 1>/dev/null 2>&1 && [ -f "$HOME/.rye/env" ]; then
    source "$HOME/.rye/env"
fi
