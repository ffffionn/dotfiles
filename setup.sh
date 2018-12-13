#!/bin/bash
#
# Set up config

curDir=$(dirname $0)

echo "source $(curDir)/aliases" >> ~/.bash_rc
cp $(curDir)/ideavimrc $HOME/.ideavimrc
source ./install_vim_extended.sh


# Git config
git config --global core.editor "vim"
git config --global alias.pull 'pull -r'
git config --global alias.append  'commit --amend --no-edit'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
