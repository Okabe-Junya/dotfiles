call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-fugitive' "nvim上でgitコマンドを叩ける
    Plug 'rhysd/conflict-marker.vim' "conflictに目印
    Plug 'airblade/vim-gitgutter'
call plug#end()
