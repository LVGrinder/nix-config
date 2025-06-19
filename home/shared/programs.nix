{ config, pkgs, ... }:

{
  # let
  #   asepriteCatppuccin = ~/Downloads/mocha.aseprite-extension;
  #   asepriteEnv = pkgs.buildEnv {
  #     name = "aseprite-env";
  #     paths = [ pkgs.aseprite asepriteCatppuccin];
  #   };
  #   in {
  #
  #   }
  home = {
    packages = with pkgs; [
      aseprite
      blender-hip
      godot_4
      catppuccin-cursors.mochaPink
      logiops
      prismlauncher
      minecraft-server # minecraft server
      # papermcServers.papermc-1_21_1 # minecraft server
      # spotify
      # spicetify-cli # to customize spotify
      xfce.thunar # gtk file manager
      xfce.thunar-archive-plugin # Archive support
      xfce.thunar-media-tags-plugin # Media tag support
      xfce.thunar-volman # Volume manager for external drives
      xfce.tumbler # Thumbnail generator for files
      dconf # Provides a backend for GTK settings | Needed for Thunar and XFCE
      caprine # Facebook Messenger desktop app
      brave # browser
      dunst # notification manager

      # lutris-unwrapped
      # wineWowPackages.stagingFull
      # (lutris.override {
      #   extraPkgs = pkgs: [
      #     #               ----
      #     #      ↓ same var ↑
      #     #     ----
      #     wineWowPackages.stagingFull

      # wineWowPackages.stagingFull
      # wineWow64Packages.stagingFull
      # winetricks
      # vulkaninfo
      # amdvlk
      #   ];
      # })
      # winetricks
      # pkgs.dxvk_2 # Vulkan redirect for DX
      # vulkan-loader
      # vulkan-validation-layers
      #
      # vulkan-extension-layer

    ];

  };

  #               ----
  #      ↓ same var ↑
  #     ----
  # pkgs.wineWowPackages.waylandFull
  # pkgs.wineWow64Packages.waylandFull
  # pkgs.winePackages.waylandFull

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
