{ config, pkgs, ... }:
{

  imports = [
    # Include the results of the hardware scan.
    # <home-manager/nixos>
    ../../shared/programs.nix
    ../../shared/gtk
  ];
  home.username = "teto";
  home.homeDirectory = "/home/teto";
  # home-manager.users.teto = { pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    signal-desktop
    ripgrep
    xterm
    webcord
    obs-studio
    # pkgs.gh
    xdg-desktop-portal-hyprland
  ];

  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "Daniel Aanensen";
    userEmail = "tetochrono@protonmail.com";
  };
  # programs.gh.enable = true;
  programs.git.extraConfig.github.user = "LVGrinder";

  programs.bash.enable = true;
  programs.gh = {
    enable = true;
  };

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

}
