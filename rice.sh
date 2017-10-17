#!/bin/bash
#
# Set up vim config and install oh-my-zsh (@ffffionn)

apt-get update;
apt-get install -y zsh vim curl git;

#  download and install fonts
git clone https://github.com/powerline/fonts ~/.fonts;
~/.fonts/install.sh;

# set up vim
mkdir -p ~/.vim/colors;
mkdir -p ~/.vim/undodir;
mkdir -p ~/.vim/swap;
mkdir -p ~/.vim/backups;
ln -s vimrc  ~/.vimrc;
cp atom-dark-256.vim  ~/.vim/colors/atom-dark-256.vim;

cp .ideavimrc  ~/.ideavimrc;

# get vundle vim and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim;
vim +PluginInstall +qall;


#  get oh my zsh and copy config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
echo "source $(pwd)/aliases" >> ~/.zshrc
