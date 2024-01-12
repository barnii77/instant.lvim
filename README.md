# Overview
instant.lvim is an instant lunarvim setup built for a blank linux distro (if there is something on it, this might interfere with installed packages).
Currently, the script has only been tested on a kali linux distro, although the installation process I used to manually install lunarvim on my debian distro was basically the same as this.
For me personally, this script is a way to very quickly and effortlessly clone my entire setup on any linux machine.

# Motivation
I wrote this because setting up lunarvim initially caused me a bunch of trouble and made me extremely annoyed at times if I didn't know what the f*ck I had done wrong.
Also, I have to (or rather, really want to) often just quickly get a (preferrably **my**) lunarvim installation up and running without too much work, so this script will also help me a lot by allowing me to pretty much just do whatever I want while I wait for the script to do the entire installation with my personal config.

# TODO
- ~lunarvim clears the \~/.config/lvim folder when run for the first time, so make sure to clone repo there after first startup.~
- ~Add nerdfont automatically~
- ~Automatically add lunarvim alias lvim=\~/.local/path/to/lvim to to \~/.bashrc~
- ~Add an information page that requires confirmation to continue and informs the user that the current launch of lunarvim is only a setup launch and the user should quit out of lvim after it's done~
