# Brewfile
rm -f ~/Brewfile
ln -s ~/.dotfiles/Brewfile ~/Brewfile

# code/settings.json
mkdir -p ~/Library/Application\ Support/Code/User
rm -f ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/.config/code/settings.json ~/Library/Application\ Support/Code/User/settings.json

# .latexmkrc
rm -f ~/.latexmkrc
ln -s ~/.dotfiles/.config/latex/.latexmkrc ~/.latexmkrc

# gitconfig
rm -f ~/.gitconfig
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# gitignore
rm -f ~/.gitignore_global
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

# .config
rm -f ~/.config
ln -s ~/.dotfiles/.config ~/.config

# .bash_profile
rm -f ~/.bash_profile
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

# .zsh
rm -f ~/.zsh
ln -s ~/.dotfiles/.zsh ~/.zsh

# .zshrc
rm -f ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
