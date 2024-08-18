# unix command aliases
alias la='lsd -a'
alias ll='lsd -l'
alias lla='lsd -la'
alias ls='lsd'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias tree='tree -C --gitignore'
alias treep='tree -C -p --gitignore'
alias pwdc='pwd | tr -d "\n" | pbcopy'

# glow (Markdown viewer)
alias -g mdpreview='glow -p -'

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

# kubectl aliases
alias k='kubectl'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'
