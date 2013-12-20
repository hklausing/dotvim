#!/bin/bash
#
# File          install.sh
# Author        H. Klausing
# Creation      2013-12-12
#
# Description   This script executes required steps to install a vim 
#               environment with components that a delivert with this 
#               repository content.
#               It is required that vim is already installed:
#               	apt-get install vim-nox
#
################################################################################


scriptname="install.sh"

### functions

package_manager_updated=0		# flag must be 0 to do update PM if required
function updatePackageManager
{
	[ $package_manager_updated ] && return
	# update package management; refresh it if the data are older than 1h.
	last_execution=$(stat -c %Y /var/cache/apt/pkgcache.bin)
	now=$(date +%s)
	if [ $(($now - $last_execution)) -gt 3600 ]; then
		sudo apt-get update
		sudo apt-get -y upgrade
	fi
	package_manager_updated=1
}


# Check the status of the installation of an given package and 
# return the result.
# Param:	name of package
# Return:	0= package not installed
#			1= package installed
function isPackageInstalled
{
	local package=$1
	out=$(dpkg --get-selections | grep -o "^${package}")
	if [ -z "$out" ]; then
		echo "0"
	else
		echo "1"
	fi
}


# check if given package is not installed 
function installPackage
{
	local package=$1
	if [ "$(isPackageInstalled $package)" == "0" ]; then
		updatePackageManager
		sudo apt-get install -y $package
	else
		echo "package $package is already installed"
	fi
}


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
    result=$(vim --version | grep +ruby)
    if [ "$result" == "" ]; then
        echo "vim does not supprt ruby - Command-T not installed."
        return
    fi

    # check if ruby is installed (for ubuntu systems)
    installPackage ruby1.9.1-full

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
    checkfile="$HOME/.vim/plugin/ack.vim"
    if [ ! -f $checkfile ]; then
        echo "ack.vim cannot installed: missing file: $checkfile"
    fi
    checkfile="$HOME/.vim/doc/ack.txt"
    if [ ! -f $checkfile ]; then
        echo "ack.vim cannot installed: missing file: $checkfile"
    fi

    # check if ack-grep is installed (for ubuntu systems)
    installPackage ack-grep

    # set a link to ack-grep for ack.vim
    if [ ! -L /usr/bin/ack ]; then
        sudo ln -s /usr/bin/ack-grep /usr/bin/ack
        echo "link /usr/bin/ack created"
    fi

    # create a .ackrc file if it is not existing
    file="$HOME/.ackrc"
    if [ ! -e $file ]; then
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


function checkColorSupport
{
    if [[ $(tput colors) == 256 && $TERM == "xterm-256color" ]]; then
        echo "terminal supports 256 colors"
    else
        echo "!!!!!!!!"
        echo "Terminal does not support 256 colors."
        echo "Add the following line to .bashrc to enable the 256 color support:"
        echo "[[ -n \"$DISPLAY\" && \"$TERM\" = \"xterm\" ]] && export TERM=xterm-256color"
        echo "!!!!!!!!"
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
installPackage vim-nox          # take care correct vim is installed
setupVimrcFile                  # creates a link of vimrc to the user root directory
setupPlugin_CommandT            # installs ruby if possible and compiles the required sources
setupPlugin_AckVim              # installs Ack.vim to system
checkColorSupport               #  

exit 0
#####

