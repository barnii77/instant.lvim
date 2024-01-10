read -r -p "Are you sure you want to uninstall? [y/N] " response
read -r -p "Are you really sure you want to uninstall? [y/N] " response
read -r -p "Are you really really sure you want to uninstall? [y/N] " response
read -r -p "Are you really really really sure (last time I will ask this) ? [y/N] " response

if [ "$HOME" = "/home/david" ] || [ "$HOME" = "/home/david/" ]; then
  # stop the program so I dont accidentally run this on my own computer
  echo "David you dummy dumb dumb what in the f*cking hell are you doing?!"
else
  rm -rf "$HOME/.config/lvim"
  rm -rf "$HOME/Downloads/instant.lvim"
  bash "$HOME/.local/share/lunarvim/lvim/utils/installer/uninstall.sh"
  rm "$HOME/.bashrc"
fi
