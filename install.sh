cd ~
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
ln -s ~/dotfiles/.ctags ~/.ctags
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.npmrc ~/.npmrc
mkdir ~/.config
mkdir ~/.config/fish
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
chmod 755 ~/dotfiles/bin/xclip
exit
