#!/usr/bin/env sh
sudo echo "a prompt for sudo" >/dev/null

echo "Backing up .vimrc"
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old >/dev/null

echo "Removing current vim configuration"
rm -rf ~/.vim
rm -f ~/.vimrc

echo 'Setting up .vimrc'
script_dir=`pwd`
ln -s "${script_dir}"/.vimrc ~/.vimrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash

sudo apt-get install ack -y

sudo npm i -g elm-format@0.8.0 --unsafe-perm=true --allow-root
sudo npm i -g elm-oracle
