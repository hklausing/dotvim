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

# Save current directory
STARTDIR=${PWD}

# Change to vim directory.
cd ~/.vim

# Create plugin storage folder.
mkdir -p bundle

# Clone the Vundle repository if required.
if [[ ! -f ./bundle/Vundle.vim/autoload/vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
fi

# Start the plugin installation in vim.
vim +PluginInstall +qall

if [[ "$?" != 0 ]]; then
    echo "Execution of plugin installation in vim failed with error code $?!"
fi

# Restore to call directory.
cd ${STARTDIR}

exit 0

