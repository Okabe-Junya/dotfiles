call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
call plug#end()

nmap <C-af> :NERDTreeToggle<CR>
