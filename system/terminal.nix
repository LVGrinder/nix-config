{ config, pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      shortcut = "a";
      clock24 = true;
      keyMode = "vi";

    };

    fish = {
      enable = true;
    };
  };
}
