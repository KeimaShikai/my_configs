#!/usr/bin/env bash

##################
## SETUP SCRIPT ##
##################

# TODO add script arguments handling
# TODO (additionally) convert in into one line commands string and put it into README

apt-get update && apt-get dist-upgrade

apt-get install \
    git \
    zsh \
    vim \
    wget \
    tmux htop \
    python3-pip

python3 -m pip install -U pip
python3 -m pip install virtualenv

mkdir Dev
git clone https://github.com/KeimaShikai/my_configs.git Dev/configs
cp Dev/configs/.vimrc Dev/configs/.tmux.conf .
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# TODO add auto installation for vim plugins

yes | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# TODO test how script will work until this moment
# Maybe it's necessary to add logout or smth like this
echo "I broke through oh-my-zsh installation!"
sleep 5

# TODO auto switch from base zsh theme to bira (via sed --in-place)
# TODO add auto tmux when start terminal

reboot
