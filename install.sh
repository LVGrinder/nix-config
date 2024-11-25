#!/bin/sh

sudo mkdir /etc/nixos.bak
sudo cp /etc/nixos/configuration.nix /etc/nixos.bak/configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix /etc/nixos.bak/hardware-configuration.nix
