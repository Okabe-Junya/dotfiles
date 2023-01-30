# Init: zshenv
ZSHENV_INIT_DIR="${HOME}/.zsh/init/zshenv"

# Pathの追加

source "${ZSHENV_INIT_DIR}/export.zsh"

if [ -d $ZSHENV_INIT_DIR ] && [ -r $ZSHENV_INIT_DIR ] && [ -x $ZSHENV_INIT_DIR ]; then
    for file in ${ZSHENV_INIT_DIR}/*.zsh; do
        [ -r $file ] && source $file
    done
fi
