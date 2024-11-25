#!/bin/sh


sudo ln /etc/nixos/configuration.nix ./configuration.nix
sudo ln /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix

sudo mkdir ./dotfiles/hypr
sudo ln ~/.config/hypr/hyprland.conf ./dotfiles/hypr/hyprland.conf
