#!/bin/bash

# Update package lists using apt and apt-get
sudo apt update
sudo apt-get update

# Install prerequisites including wget and w3m using apt
sudo apt install -y git make python3-pip npm nodejs curl wget w3m

# Install Rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install Neovim via AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract

# Check Neovim version
./squashfs-root/AppRun --version

# Optional: Expose nvim globally
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install Anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh
bash Anaconda3-latest-Linux-x86_64.sh -b -p $HOME/anaconda3
rm Anaconda3-latest-Linux-x86_64.sh
$HOME/anaconda3/bin/conda init bash

# Install LunarVim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# Clone and set up personal LunarVim configuration
git clone https://github.com/barnii77/config.lvim.git ~/.config/lvim
cd ~/.config/lvim
bash ./install.sh

# Start LunarVim
lvim
