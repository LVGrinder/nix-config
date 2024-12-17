{ config, pkgs, ... }:

{
  programs = {
    waybar.enable = true;
  };
  environment.systemPackages = with pkgs; [
    wofi
  ];
}
