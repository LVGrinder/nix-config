#!/bin/sh

# save user
current_user=$(whoami)

echo "User is: $current_user"

#folder location
hypr=~/nix-config/dotfiles/hypr/user/$current_user/hyprland.conf

echo "$hypr"

sudo rm -r ~/.config/hypr
sudo mkdir ~/.config/hypr
sudo ln -s ~/nix-config/dotfiles/hypr/users/"$current_user"/hyprland.conf ~/.config/hypr/hyprland.conf
