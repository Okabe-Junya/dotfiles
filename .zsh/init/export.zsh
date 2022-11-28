export PS1="%~ "
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
eval "$(rbenv init -)"
fpath=(~/.zsh $fpath)

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
