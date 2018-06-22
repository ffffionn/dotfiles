#!/bin/bash
#
# Set up config

curDir=$(pwd)

echo "source $(pwd)/aliases" >> ~/.bash_rc
cp $( pwd )/ideavimrc $HOME/.ideavimrc
source ./install_vim_extended.sh
