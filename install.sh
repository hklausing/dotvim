#!/bin/bash
#
# File          install.sh
# Author        H. Klausing
# Creation      2013-12-12
#
# Description   This script executes required steps to install a vim 
#               environment based on the github repository:
#                   git@github.com:hklausing/dotvim.git
#
################################################################################

# remove existing ~/.vimrc file
rm -f ~/.vimrc

# create link
ln -s ~/.vim/vimrc ~/.vimrc

# change to vin directory
STARTDIR=${PWD}
cd ~/.vim

# get Vundle repository data
git submodule update
git submodule init

# restore directory
cd ${STARTDIR}

exit 0

