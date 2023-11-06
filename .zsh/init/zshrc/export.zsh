# Homebrew
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

fpath=(~/.zsh $fpath)

# llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
