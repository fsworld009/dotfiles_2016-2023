#!/bin/bash

DOTFILES="$HOME/dotfiles"
LINK_FILES=(".gitconfig" ".editorconfig" ".ctags" ".tmux.conf.local")
# shouldn't link .npmrc because auth token is stored in this file
# shouldn't delete .bashrc and .bash_profile at ~ to avoid erasing system default ones
COPY_FILES=(".bashrc" ".bash_profile" ".npmrc")

pushd $HOME > /dev/null
for i in ${LINK_FILES[*]}; do
  if [ -f $i ] && [ ! -L $i ]; then
    echo -e "\e[1m\e[33mSkip $i because it already exists and it's not a symbolic link."
  else
	  rm -f $i
    ln -s "$DOTFILES/$i" $i
    echo "$(pwd)/$i Created."
  fi
done

# .tmux.conf
if [ -f .tmux.conf ] && [ ! -L .tmux.conf ]; then
  echo -e "\e[1m\e[33mSkip $i because it already exists and it's not a symbolic link."
else
  rm -f .tmux.conf
  ln -s "$DOTFILES/.tmux/.tmux.conf" .tmux.conf
  echo "$(pwd)/.tmux.conf Created."
fi


# Don't copy files if they already exist
for i in ${COPY_FILES[*]}; do
  if [ -f $i ]; then
    echo -e "\e[1m\e[33mSkip $i because it already exists."
  else
    cp "$DOTFILES/$i" $i
    echo "$(pwd)/$i Created."
  fi
done

# fish
mkdir -p .config
mkdir -p .config/fish
rm -f .config/fish/config.fish
ln -s $DOTFILES/fish/config.fish .config/fish/config.fish
echo "$(pwd)/.config/fish/config.fish Created."
chmod 755 $DOTFILES/bin/xclip
popd > /dev/null
