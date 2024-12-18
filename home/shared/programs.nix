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
    ];
  };

}
