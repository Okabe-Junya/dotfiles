FIG_DIR="${HOME}/.zsh/fig"
source "${FIG_DIR}/pre.zsh"

# Initialize
ZSH_INIT_DIR="${HOME}/.zsh/init"

if [ -d $ZSH_INIT_DIR ] && [ -r $ZSH_INIT_DIR ] && [ -x $ZSH_INIT_DIR ]; then
  for file in ${ZSH_INIT_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

source "${FIG_DIR}/post.zsh"
