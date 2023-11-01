#!/bin/bash
sudo pacman -S neofetch htop tmux neovim firefox alacritty zsh xf86-input-libinput light xorg-xsetroot redshift playerctl ranger scrot pavucontrol base-devel openssh acpi lxsession feh bluez bluez-utils xclip dunst npm udiskie $(sudo pacman -Ssq ttf-)

ssh-keygen -t rsa

# keyboard, touchpad, amd configs files
sudo cp -r ./xorg.conf.d/* /etc/X11/xorg.conf.d/
sudo rm -rf ./xorg.conf.d/

# move .config to ~
sudo mv ./.config/* /home/$(whoami)/.config/
rm -rf ./.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# move .xinitrc and .zshrc to ~
mv .xinitrc .zshrc /home/$(whoami)/

# move wallpapper to ~ and set it 
mv wp.png /home/$(whoami)/
feh --bg-center /home/$(whoami)/wp.png

rm -rf ../dotfiles/

# install dwm
cd /home/$(whoami)/.config/dwm/
make
sudo make install

echo "done"
