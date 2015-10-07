echo "Backing up .vimrc"
mv ~/.vimrc ~/.vimrc.old
echo "Creating symlink to .vimrc"
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
