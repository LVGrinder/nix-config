{ config, pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
    };

    fish = {
      enable = true;
    };
  };
}
