#!/bin/bash
#

echo -n "Install Plugins? [y/n]:"
read -n 1 plugins

curDir=$(pwd)

cat ${curDir}/basic.vim > $HOME/.vimrc
cat ${curDir}/extended.vim >> $HOME/.vimrc

mkdir -p $HOME/.vim/colors
cp ${curDir}/atom-dark-256.vim $HOME/.vim/colors/

# get vundle vim and install plugins


if [ "${plugins}" == "y" ] ; then
    echo "Installing Plugins...";
    cat ${curDir}/plugins.vim >> $HOME/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim;
    vim +PluginInstall +qall;
fi
