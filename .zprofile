# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
# Init: zprofile
ZPROFILE_INIT_DIR="${HOME}/.zsh/init/zprofile"

# if [ -d $ZPROFILE_INIT_DIR ] && [ -r $ZPROFILE_INIT_DIR ] && [ -x $ZPROFILE_INIT_DIR ]; then
#     for file in ${ZPROFILE_INIT_DIR}/*.zsh; do
#         [ -r $file ] && source $file
#     done
# fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
