#!/bin/bash
#
# File          install.sh
# Author        H. Klausing
# Creation      2013-12-12
#
# Description   This script executes required steps to install a vim 
#               environment with components that a delivert with this 
#               repository content.
#               It is required that vim is already installed.
#
################################################################################


scriptname="install.sh"

### functions

function setCorrectWorkingDir
{
    cur_dir=${PWD##*/}              # to assign to a variable
    if [ "$cur_dir" != ".vim" ]; then
        cd ~/.vim
    fi

    if [ "${PWD##*/}" != ".vim" ]; then
        echo "Error: directory .vim not found!"
        exit 1;
    fi

    echo "directory ~/.vim is existing - ok"
}

function setupVimrcFile
{
    # check if source file is existing
    if [ ! -f 'vimrc' ]; then
        echo "Error: source file ~/.vim/vimrc does not exist!"
        exit 1
    fi

    # create link
    if [ ! -L ~/.vimrc ]; then
        ln -s ~/.vim/vimrc ~/.vimrc
    fi

}

function setupPlugin_CommandT
{
    # test if vim supports ruby
    result=`vim --version|grep +ruby`
    if [ "$result" == "" ]; then
        echo "vim does not supprt ruby - Command-T not installed."
        return
    fi

    # check if ruby is installed (for ubuntu systems)
    package='ruby-dev'
    result=`dpkg-query -W -f='${Status}' $package | grep installed`
    if [ "$result" == "" ]; then
       sudo apt-get -Y install $package 
    fi

    #
    path="ruby/command-t"
    cd $path
    file="extconf.rb"
    if [ -f "$file" ]; then
        ruby $file
        make
        ret_code=$?
        if [ $ret_code != 0 ]; then
            echo "Preparation of Command-T failed."
            return
        fi
    else
        echo "File $file not found!"
    fi

    echo "Command-T installed."
}

function setupPlugin_AckVim
{
    # check if required ack.vim file existing
    checkfile="~/.vim/plugin/ack.vim"
    if [ ! -f $checkfile ]; then
        echo "ack.vim cannot installed: missing file: $checkfile"
    fi
    checkfile="~/.vim/doc/ack.txt"
    if [ ! -f $checkfile ]; then
        echo "ack.vim cannot installed: missing file: $checkfile"
    fi

    # check if ack-grep is installed (for ubuntu systems)
    package='ack-grep'
    result=`dpkg-query -W -f='${Status}' $package | grep installed`
    if [ "$result" == "" ]; then
       sudo apt-get -Y install $package 
       echo "package: $package is installed"
   else
       echo "package: $package was already installed"
    fi

    # set a link to ack-grep for ack.vim
    if [ ! -L /usr/bin/ack ]; then
        sudo ln -s /usr/bin/ack-grep /usr/bin/ack
        echo "link /usr/bin/ack created"
    fi

    # create a .ackrc file if it is not existing
    file="~/.ackrc"
    if [ ! -f $file ]; then
        tee $file <<EOF
# Always sort the files
--sort-files

# Always color, even if piping to a another program
--color

# Use "less -r" as my pager
--pager=less -r

EOF
    fi
}

function usage
{
    echo -e "usage: $scriptname\n"
    echo -e "EXAMPLE:"
    echo -e "  $scriptname"
}

#####

### Main

# parameter while-loop
while [ "$1" != "" ];
do
    case $1 in
   -h  | --help )         usage
                          exit
                ;;
   *)                     usage
                          echo "The parameter $1 is not allowed"
                          exit 1 # error
                ;;
    esac
    shift
done


setCorrectWorkingDir
setupVimrcFile                  # creates a link of vimrc to the user root directory
setupPlugin_CommandT            # installs ruby if possible and compiles the required sources
setupPlugin_AckVim              # installs Ack.vim to system

exit 0
#####

