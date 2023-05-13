# Init: zprofile
ZPROFILE_INIT_DIR="${HOME}/.zsh/init/zprofile"

if [ -d $ZPROFILE_INIT_DIR ] && [ -r $ZPROFILE_INIT_DIR ] && [ -x $ZPROFILE_INIT_DIR ]; then
    for file in ${ZPROFILE_INIT_DIR}/*.zsh; do
        [ -r $file ] && source $file
    done
fi
