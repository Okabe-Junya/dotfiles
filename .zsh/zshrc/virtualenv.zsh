#!/usr/bin/env zsh

# Lazy initialization for version managers to speed up shell startup.
# The wrapper function is replaced by the real init on first invocation.

if command -v pyenv 1>/dev/null 2>&1; then
    pyenv() {
        unfunction pyenv
        eval "$(command pyenv init -)"
        pyenv "$@"
    }
fi
if command -v nodenv 1>/dev/null 2>&1; then
    nodenv() {
        unfunction nodenv
        eval "$(command nodenv init -)"
        nodenv "$@"
    }
fi
if command -v rbenv 1>/dev/null 2>&1; then
    rbenv() {
        unfunction rbenv
        eval "$(command rbenv init -)"
        rbenv "$@"
    }
fi
if command -v direnv 1>/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi
if command -v rye 1>/dev/null 2>&1 && [ -f "$HOME/.rye/env" ]; then
    source "$HOME/.rye/env"
fi
