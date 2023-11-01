#!/bin/bash
sudo pacman -S neofetch htop tmux neovim firefox alacritty zsh xf86-input-libinput light xorg-xsetroot redshift playerctl ranger scrot pavucontrol base-devel openssh acpi lxsession feh bluez bluez-utils xclip dunst npm udiskie $(sudo pacman -Ssq ttf-)

ssh-keygen -t rsa

# keyboard, touchpad, amd configs files
sudo cp -r ./xorg.conf.d/* /etc/X11/xorg.conf.d/
sudo rm -rf ./xorg.conf.d/

# move .config to ~
sudo mv ./.config/* $HOME/config/
rm -rf ./.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# move .xinitrc to ~
mv .xinitrc $HOME

# oh-my-zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mv -f .zshrc $HOME

# move wallpapper to ~ and set it 
mv wp.png $HOME
feh --bg-center $HOME/wp.png

rm -rf ../dotfiles/

# install dwm
cd $HOME/.config/dwm/
make
sudo make install

echo "====="
echo "Done!"
