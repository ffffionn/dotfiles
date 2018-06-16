#!/bin/bash
#
# Copy basic.vim to ~/.vimrc as well as atom-dark colorscheme

cp -v basic.vim $HOME/.vimrc

mkdir -p ~/.vim/colors
cp atom-dark-256.vim  ~/.vim/colors/atom-dark-256.vim;
