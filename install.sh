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

# Install a nerdfont (I use 0xProto)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip
unzip 0xProto.zip -d 0xProto
mv 0xProto/0xProtoNerdFont-Regular.ttf $HOME/.local/share/fonts/
rm -rf 0xProto
rm 0xProto.zip

# Wait for user to read the text saying that installation is not done after the lunarvim finishes it's setup
clear
echo "LunarVim will be launched for initial setup now. When it is done, please quit it and dont close the window"
read -r

# Install and run lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# Append the PATH update to the appropriate file
# Check for .bashrc
if [ -f "$HOME/.zshenv" ]; then
  echo "Found .zshenv in home directory"
  echo -e "\n\nalias lvim=$HOME/.local/bin/lvim" >> $HOME/.zshenv
  source $HOME/.zshenv
else
  if [ -f "$HOME/.bashrc" ]; then
      echo "Found .bashrc in home directory"
      echo -e "\n\nalias lvim=$HOME/.local/bin/lvim" >> $HOME/.bashrc
      source $HOME/.bashrc
  else
      # Check for .bash_profile
      if [ -f "$HOME/.bash_profile" ]; then
          echo "Found .bash_profile in home directory"
          echo -e "\n\nalias lvim=$HOME/.local/bin/lvim" >> $HOME/.bash_profile
          source $HOME/.bash_profile
      else
          # Check for .profile
          echo "Found .profile in home directory"
          echo -e "\n\nalias lvim=$HOME/.local/bin/lvim" >> $HOME/.profile
          source $HOME/.profile
      fi
fi

# Clone and set up personal LunarVim configurationg
rm -rf $HOME/.config/lvim/*  # first clear default config
rm -rf $HOME/.config/lvim/.*  # also remove hidden directories which are not removed by the above command (if there happen to be any)
git clone https://github.com/barnii77/config.lvim.git $HOME/.config/lvim
cd $HOME/.config/lvim

# Start lvim for for first use and plugins
$HOME/.local/bin/lvim config.lua
