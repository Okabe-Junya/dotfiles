#!/usr/bin/env zsh

# Homebrew
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# launcher
export PATH="$HOME/.rd/bin:$PATH"
