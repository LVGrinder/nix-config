#!/bin/sh

# save user
current_user=$(whoami)

echo "User is: $current_user"

#folder location
hypr=~/nix-config/dotfiles/hypr/user/$current_user/hyprland.conf

echo "$hypr"

sudo rm -r ~/.config/hypr/hyprland.conf
echo "deleted"
sudo mkdir ~/.config/hypr
echo "source = ~/nix-config/dotfiles/hypr/users/$current_user/hyprland.conf" | sudo tee -a ~/.config/hypr/hyprland.conf



