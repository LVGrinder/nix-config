{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    catppuccin-gtk
    noto-fonts # Fonts
    noto-fonts-emoji # Emoji support
    noto-fonts-cjk-sans # CJK character support
    papirus-icon-theme # Icon theme
    adwaita-icon-theme # Default GTK icon theme
    lxappearance # Optional GUI for managing GTK themes
  ];
  gtk = {
    enable = true;
    # theme = {
    #   name = "catppuccin-mocha-teal-standard+default"; # GTK theme
    #   package = pkgs.catppuccin-gtk; # Replace with the Catppuccin theme package
    # };
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };

    iconTheme = {
      name = "Papirus"; # Icon theme
      package = pkgs.papirus-icon-theme; # Replace with your desired icon theme package
    };
  };
}
