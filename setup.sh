#!/bin/bash
#
# Set up config

curDir=$(pwd)

echo "source $(pwd)/aliases" >> ~/.bash_rc
cat $( pwd )/basic.vim > $HOME/.ideavimrc
source ./install_vim_extended.sh
