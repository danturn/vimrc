echo "Backing up .vimrc"
mv ~/.vimrc ~/.vimrc.old
echo "Creating symlink to .vimrc"
ln -s ~/dotfiles/.vimrc ~/.vimrc
