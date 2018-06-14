#!/usr/bin/env sh
sudo echo "a prompt for sudo" >/dev/null 

echo "Backing up .vimrc"
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old >/dev/null

echo "Removing current vim configuration"
rm -rf ~/.vim 
rm -f ~/.vimrc

echo 'Installing Vundle - https://github.com/VundleVim/Vundle.vim'
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

echo 'Installing Vim plugins'
script_dir=`pwd`

echo """
     set nocompatible
     filetype off
     set rtp+=~/.vim/bundle/Vundle.vim
     call vundle#begin()
     """  > "${script_dir}"/vimrctemp

grep "Plugin '" .vimrc >> "${script_dir}"/vimrctemp
echo 'call vundle#end()            
' >> "${script_dir}"/vimrctemp

ln -s "${script_dir}"/vimrctemp ~/.vimrc
vim +PluginInstall +qall

rm ~/.vimrc
rm "${script_dir}"/vimrctemp

echo 'Setting up .vimrc'
ln -s "${script_dir}"/.vimrc ~/.vimrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash
