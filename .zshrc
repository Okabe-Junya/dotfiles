# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# >>> fig >>>
# >>> alias >>>
alias ll='ls -Gl'
alias ls='ls -G'
alias sl='ls -G'
alias la='ls -GA'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias tree='tree -C'
alias q='exit'
alias :wq='exit'
alias pwdc='pwd | tr -d "\n" | pbcopy'
alias mysql.server stop='brew services stop mysql'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gs='git status'

# >>> global alias >>>
alias -g C='| pbcopy'
alias -g G='| grep --color=auto'

# >>> path >>>
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

# >>> source >>>
source ~/.zsh/git-prompt.sh
source ~/.pyenv/versions/miniforge3-4.10.3-10/bin/activate

# >>> arm-x86 >>>
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
  PR_ARCH="ARM"
  export BREWx86_BASE=/opt/brew_x86
  export BREW_BASE=/opt/homebrew
  export PATH=${BREWx86_BASE}/bin:${BREWx86_BASE}/sbin${PATH:+:${PATH}}
  export PATH=${BREW_BASE}/bin:${BREW_BASE}/sbin${PATH:+:${PATH}}
else
  PR_ARCH="x86"
  export BREW_BASE=/opt/brew_x86
  # export PATH=${BREW_BASE}/bin:${BREW_BASE}/sbin${PATH:+:${PATH}}
  export PATH=${PATH//¥/homebrew¥//¥/brew_x86¥/}
fi

export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# >>> option >>>
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST
PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# >>> fig >>>

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
