DOTFILES="$HOME/dotfiles"
LINK_FILES=(".bash_profile" ".bashrc" ".gitconfig" ".editorconfig" ".ctags" ".tmux.conf")

pushd $HOME > /dev/null
for i in ${LINK_FILES[*]}; do
	rm -f $i
  ln -s "$DOTFILES/$i" $i
  echo "$(pwd)/$i Created."
done

# don't link .npmrc, instead do a copy to avoid saving auth token into this repo
if [ -f ".npmrc" ]; then
  echo -e '\e[1m\e[33mSkip .npmrc because it already exists.'
  echo -e 'Please update it manually to prevent from losing auth token.\e[0m'
else
  cp $DOTFILES/.npmrc .npmrc
  echo "$(pwd)/.npmrc Created."
fi

# fish
rm -rf .config/fish
mkdir -p .config
mkdir -p .config/fish
ln -s $DOTFILES/fish/config.fish .config/fish/config.fish
echo "$(pwd)/.config/fish/config.fish Created."
chmod 755 $DOTFILES/bin/xclip
popd > /dev/null
