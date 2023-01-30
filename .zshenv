# Init: zshenv
ZSHENV_INIT_DIR="${HOME}/.zsh/init/zshenv"

# Pathの追加
source "${ZSHENV_INIT_DIR}/export.zsh"
source "${ZSHENV_INIT_DIR}/arch.zsh"

# 仮想環境の初期化
source "${ZSHENV_INIT_DIR}/virtual_env.zsh"
