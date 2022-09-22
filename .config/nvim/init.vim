let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Any valid git URL is allowed
    Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " Multiple Plug commands can be written in a single line using | separators
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " Plugin options
    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " coc （自動保管）
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
