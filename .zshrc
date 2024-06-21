# Initialize
ZSH_INIT_DIR="${HOME}/.zsh/init/zshrc"

if [ -d $ZSH_INIT_DIR ] && [ -r $ZSH_INIT_DIR ] && [ -x $ZSH_INIT_DIR ]; then
  for file in ${ZSH_INIT_DIR}/*.zsh; do
    [ -r $file ] && source $file
  done
  # source ${ZSH_INIT_DIR}/post/post.zsh
fi

source "${ZSH_INIT_DIR}/alias.zsh"
