#!/bin/bash
#
# Set up vim and zsh setup along with other things  (@ffffionn)

apt-get install -y zsh vim git;
apt-get update;

git clone https://github.com/ffffionn/dotfiles.git ~/dotfiles;

#  download and install fonts
cd ~;
git clone https://github.com/powerline/fonts;
./fonts/install.sh;

# set up dotfiles
mkdir -p ~/.vim/colors;
mkdir -p ~/.swpFiles;
cp ~/dotfiles/atom-dark-256.vim  ~/.vim/colors/atom-dark-256.vim;
cp ~/dotfiles/plugins.vim  ~/.vim/;
ln -s ~/dotfiles/vimrc  ~/.vimrc;
cp ~/dotfiles/zshrc ~/.zshrc

# get vundle vim 
git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim

# install plugins 
vim +PluginInstall +qall;


#  get oh my zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

