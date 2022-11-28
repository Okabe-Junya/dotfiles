# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

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

alias -g C='| pbcopy'
alias -g G='| grep --color=auto'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
