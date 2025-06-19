#!/bin/sh

sudo nix-collect-garbage -d # making space
sudo nixos-rebuild switch   # switch to newest build
sudo nixos-rebuild boot     # building boot
