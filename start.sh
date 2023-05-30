#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

#Remove vim and neovim installed by apt
sudo apt purge -y vim neovim
#install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

#set alias
echo "alias vim='${SCRIPT_DIR}/nvim.appimage'" >> ~/.bashrc
echo "alias ide='${SCRIPT_DIR}/ide.sh'" >> ~/.bashrc

#set nvim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/undo

ln -s ${SCRIPT_DIR}/colors ~/.config/nvim/colors

#inputrc
cat ${SCRIPT_DIR}/inputrc >> ~/.inputrc

#tmux conf
echo "source $SCRIPT_DIR/tmux.conf" >> ~/.tmux.conf

#powerline font
echo "installing powerline font"
# git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline_fonts \
# && cd /tmp/powerline_fonts \
# && ./install.sh

#install node.js
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt install -y nodejs

