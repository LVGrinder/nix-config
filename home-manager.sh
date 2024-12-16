#!/bin/sh

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<nixpkgs>' -A home-manager
