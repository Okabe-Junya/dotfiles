# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
FIG_DIR="${HOME}/.zsh/fig"
source "${FIG_DIR}/pre.zsh"

# Initialize
ZSH_INIT_DIR="${HOME}/.zsh/init/zshrc"

if [ -d $ZSH_INIT_DIR ] && [ -r $ZSH_INIT_DIR ] && [ -x $ZSH_INIT_DIR ]; then
  for file in ${ZSH_INIT_DIR}/*.zsh; do
    [ -r $file ] && source $file
  done
  # source ${ZSH_INIT_DIR}/post/post.zsh
fi

source "${FIG_DIR}/post.zsh"
source "${ZSH_INIT_DIR}/alias.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
