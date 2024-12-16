#!/bin/sh



# Delete first
sudo rm /etc/nixos/configuration.nix
sudo rm /etc/nixos/hardware-configuration.nix
sudo rm -r ~/.config/hypr


sudo ln -s ~/nix-config/configuration.nix /etc/nixos/configuration.nix 
sudo ln -s ~/nix-config/hardware-configuration.nix /etc/nixos/hardware-configuration.nix

sudo mkdir ~/.config/hypr
sudo ln -s ~/nix-config/dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf