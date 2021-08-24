#!/usr/bin/env bash

print_help ()
{
cat <<HELP
Usage: ${PROGNAME} [-n|--nvim] [-t|--tmux] [-z|--zsh]

The app to be configured can be chosen by command line arguments.

Command line arguments are as following:
    -h | --help     Print this help
    -n | --nvim     Install and setup neovim

Usage example
    ./setup_tools.sh --nvim
HELP
}

# get OS type and version
get_os_type ()
{
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VERSION=$VERSION_ID
    elif type lsb_release > /dev/null 2>&1; then
        OS=$(lsb_release -si)
        VERSION=$(lsb_release -sr)
    else
        OS=$(uname -s)
        VERSION=$(uname -r)
    fi
}

setup_working_dir()
{
    cd ~
    echo "The working directory has been set to [ `echo ~` ]"
}

check_if_command_exists ()
{
    type $1 &> /dev/null || {
      echo 'Please install git or update your path to include the git executable!'
      exit 1
    }
}

check_depends ()
{
    ############################################
    # $1 - array of strings
    ############################################
    for i in "$1"; do
        check_if_command_exists $i
    done
}

remove_file ()
{
    if [ -e "$1" ]; then
        echo -n "The following file will be removed: [ $1 ]. Proceed? (y/n)? "
        read answer
        if echo "$answer" | grep -iq "^y"; then
            rm -rf $1
            echo "File $1 has been removed."
        else
            return 1
        fi
    fi
}

remove_dir ()
{
    if [ -d "$1" ]; then
        echo -n "The following directory will be removed: [ $1 ]. Proceed? (y/n)? "
        read answer
        if echo "$answer" | grep -iq "^y"; then
            rm -rf $1
            echo "Directory $1 has been removed."
        else
            return 1
        fi
    fi
}

# install package depending on OS distribution
install_package ()
{
    if [ -z "$1" ]; then
        echo "No package parameter supplied."
    fi

    case $OS in
        "Ubuntu")
            echo "INFO: Installing package [ $1 ] ..."
            sudo apt-get install $1 -y 1> /dev/null || (echo "ERROR: Installation of package $1 failed." && exit 1)
            ;;
        "Arch Linux")
            echo "INFO: Installing package [ $1 ] ..."
            sudo pacman -S $1 --noconfirm 1> /dev/null || echo "ERROR: Installation of package $1 failed." && exit 1
            ;;
        *)
            echo "This script is not compatible with this OS."
            ;;
    esac
}

inform_user ()
{
cat <<INFO
!!! ATTENTION
This script will run for user [ $USER ]
Config files will be installed according directory [ `echo ~` ]

INFO
}

clone_repo ()
{
    cd ~
    remove_dir dotfiles
    [ $? -ne 0 ] && return 1
    echo "++++++ Clonning up repo https://github.com/ssd04/dotfiles.git ++++++"
    git clone https://github.com/ssd04/dotfiles.git
}


basic_setup ()
{
    echo "++++++ Setting up aliases ++++++"
    remove_file .bash_aliases
    [ $? -ne 0 ] && return 1
    ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases

    echo "++++++ Setting up vim ++++++"
    remove_file .vimrc
    [ $? -ne 0 ] && return 1
    ln -s ~/dotfiles/.vimrc ~/.vimrc
}

setup_vifm ()
{
    echo "++++++ Setting up aliases ++++++"
    remove_file .config/vifm/vifmrc
    [ $? -ne 0 ] && return 1
    ln -s ~/dotfiles/vifmrc ~/.config/vifm/vifmrc
    echo "Config file setup successfully."
}

setup_zsh ()
{
    echo "++++++ Setting up zsh ++++++"
    echo "Install required packages..."
    install_package zsh
    echo "Packages installed successfully."
    remove_file .zshrc
    [ $? -ne 0 ] && return 1
    ln -s ~/dotfiles/.zshrc ~/.zshrc
    remove_dir .oh-my-zsh
    [ $? -ne 0 ] && return 1
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo "Zsh setup successfully. Set default shell by: chsh -s /bin/bash"
}

setup_i3 ()
{
    echo "++++++ Setting up i3 ++++++"
    echo "Install required packages..."
    sudo add-apt-repository ppa:kgilmer/speed-ricer
    sudo apt-get update
    install_package i3_gaps
    install_package i3lock
    echo "Packages installed successfully."
    echo "Setup i3 ..."
    remove_file ~/.config/i3/config
    ln -s ~/dotfiles/i3_config ~/.config/i3/config
    ln -s ~/dotfiles/i3_scripts ~/.config/i3/scripts
    echo "Setup status bar"
    case $OS in
        "Ubuntu")
            install_package fonts-font-awesome
            install_package fonts-powerline
            ;;
        "Arch Linux")
            install_package awesome-terminal-fonts
            install_package fonts-powerline
            ;;
        *)
            ;;
    esac
    git clone git://github.com/tobi-wan-kenobi/bumblebee-status ~/..config/i3
    echo "i3-gaps setup successfully."
}

setup_tmux ()
{
    echo "++++++ Setting up tmux ++++++"
    remove_file .tmux.conf
    [ $? -ne 0 ] && return 1
    echo "Install required packages..."
    install_package tmux
    echo "Packages installed successfully."
    echo "Setup neovim config file..."
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    echo "Config file setup successfully."
}

setup_neovim ()
{
    echo "++++++ Setting up neovim ++++++"
    remove_dir .config/nvim
    [ $? -ne 0 ] && return 1
    echo "Install required packages..."
    mkdir ~/.config/nvim
    install_package neovim
    install_package python-neovim
    case $OS in
        "Ubuntu")
            install_package python3-neovim
            ;;
        "Arch Linux")
            install_package python2-neovim
            ;;
        *)
            ;;
    esac
    python3 -m pip install neovim
    python2 -m pip install neovim
    echo "Packages installed successfully."
    echo "Setup neovim config file..."
    ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
    nvim -c 'PlugInstall'
    echo "Config file setup successfully."
}

install_nodejs()
{
    :'
    Nodejs (at least v12.22.0) is required for coc.nvim plugin
    '

    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

    install_package nodejs
}

cpp_setup()
{
    install_package ccls
}

# Main program
get_os_type
setup_working_dir

dependencies=(
    git
    pip
    pip3
)

# Get command line options
TEMP=`getopt -o acbntzvh --long all,checks,basic-config,neovim,tmux,zsh,vifm,help -- "$@"`
eval set -- "$TEMP"

while true ; do
    case $1 in
        -c|--checks)
            check_depends "${dependencies[@]}";
            clone_repo;
            shift ;;
        -b|--basic-config)
            basic_setup;
            shift ;;
        -n|--neovim)
            setup_neovim;
            shift ;;
        -t|--tmux)
            setup_tmux;
            shift ;;
        -z|--zsh)
            setup_zsh;
            shift ;;
        -i|--i3)
            setup_i3;
            shift ;;
        -v|--vifm)
            setup_vifm;
            shift ;;
        -a|--all)
            check_depends "${dependencies[@]}";
            clone_repo;
            basic_setup;
            setup_neovim;
            setup_tmux;
            setup_zsh;
            setup_vifm;
            shift ;;
        -h|--help)
            print_help ; exit 1 ;;
        --) shift ; break ;;
        *) echo "Please check command line parameters.\n" ; print_help ; exit 1 ;;
    esac
done
