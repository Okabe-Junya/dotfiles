let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " git 関連
    Plug 'tpope/vim-fugitive' "nvim上でgitコマンドを叩ける
    Plug 'rhysd/conflict-marker.vim' "conflictに目印
    Plug 'airblade/vim-gitgutter'

    " go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " nerdtree
    Plug 'preservim/nerdtree'
call plug#end()



runtime! init/*.vim
