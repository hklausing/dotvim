#!/bin/bash
#
# File          ~/.vim/install.sh
# Author        H. Klausing
# Creation      2013-12-12
#
# Description   This script executes required steps to install a vim 
#               environment based on the github repository:
#                   git@github.com:hklausing/dotvim.git
#
################################################################################

# change to vin directory
STARTDIR=${PWD}
cd ~/.vim

# get Vundle repository data
mkdir -p bundle
[ ! -f ./bundle/Vundle.vim/autoload/vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim

# start the plugin installation in vim
vim +PluginInstall +qall

# restore directory
cd ${STARTDIR}

exit 0

