{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      spotify
      spicetify-cli # to customize spotify
      xfce.thunar # gtk file manager
      xfce.thunar-archive-plugin # Archive support
      xfce.thunar-media-tags-plugin # Media tag support
      xfce.thunar-volman # Volume manager for external drives
      xfce.tumbler # Thumbnail generator for files
      dconf # Provides a backend for GTK settings | Needed for Thunar and XFCE
      caprine # Facebook Messenger desktop app
      brave # browser
      dunst # notification manager
    ];

  };

  programs = {
    kitty = {
      enable = true;
      # font.packages = "nerd-fonts.fira-code";
      font.name = "FiraCode Nerd Font";
      font.package = pkgs.nerd-fonts.fira-code;
      themeFile = "Catppuccin-Mocha";
    };
  };
}
