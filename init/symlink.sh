rm -f ~/Brewfile
ln -s ~/.dotfiles/Brewfile ~/Brewfile

rm -f ~/.gitconfig
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

rm -f ~/.gitignore_global
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

rm -f ~/.config
ln -s ~/.dotfiles/.config ~/.config

rm -f ~/.zsh
ln -s ~/.dotfiles/.zsh ~/.zsh

rm -f ~/.bash_profile
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

rm -f ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
