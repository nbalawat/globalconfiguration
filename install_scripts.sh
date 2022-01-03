#!/bin/bash

# First upgrade the package manager
sudo apt update
sudo apt upgrade

# install curl and other basic tools
sudo apt-get --yes install curl
sudo apt-get --yes install sudo

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh
source ~/.bashrc
sudo nvm install 16.4.2
sudo nvm install lts/fermium
sudo nvm install lts/erbium
sudo nvm install lts/dubnium
sudo nvm install lts/carbon
sudo nvm use 16.4.2

mkdir pythonenvs
cd pythonenvs
python3 -m venv pythoncore
source pythoncore/bin/activate

# install windows manager
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install a terminal multiplexer and other productivity tools
sudo apt install tmux zoxide fzf

# install the favorite shells on the machine
sudo apt install --yes fish
sudo apt install --yes zsh
sudo chsh -s /usr/bin/fish

# install ansible on Ubuntu
sudo apt install --yes ansible

# Now clone the repository
cd $HOME
sudo git clone https://github.com/nbalawat/globalconfiguration.git $HOME/configuration

# Now setup the configurations that you care about - starting with nvim
# you can write a shell loop to configure the profiles that you want
cd $HOME/configuration 
stow -t $HOME -S nvim/
stow -t $HOME -S ssh/
stow -t $HOME -S git/
stow -t $HOME -S fish/
stow -t $HOME -S zsh/

# Docker Commands to Build the container
# docker run -rm -it dev-setup bash
# docker run -rm -it dev-nvim-setup bash



