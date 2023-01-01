# unix command aliases
alias ll='lsd -Gl'
alias ls='lsd -G'
alias la='lsd -G -a'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias tree='tree -C --gitignore'
alias treep='tree -C -p --gitignore'
alias q='exit'
alias :wq='exit'
alias pwdc='pwd | tr -d "\n" | pbcopy'

alias mysql.server stop='brew services stop mysql'

# git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gs='git status'

# global aliases
alias -g C='| pbcopy'
alias -g G='| grep --color=auto'
