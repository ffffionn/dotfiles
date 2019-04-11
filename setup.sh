#!/bin/bash
#
# Set up config

cd `dirname $0`
DOTFILES=`pwd`

echo "source $DOTFILES/aliases" >> ~/.bash_rc
cp $DOTFILES/ideavimrc $HOME/.ideavimrc
source ./install_vim_extended.sh

cd -


# Git config
git config --global core.editor "vim"
git config --global alias.pull 'pull -r'
git config --global alias.append  'commit --amend --no-edit'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
