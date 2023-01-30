# pathの追加

ZSHENV_INIT_DIR="${HOME}/.zsh/init/zshenv"
if [ -d $ZSHENV_INIT_DIR ] && [ -r $ZSHENV_INIT_DIR ] && [ -x $ZSHENV_INIT_DIR ]; then
    for file in ${ZSHENV_INIT_DIR}/*.zsh; do
        [ -r $file ] && source $file
    done
fi
