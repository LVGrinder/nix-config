{ config, pkgs, ... }:
{

  imports = [
    # Include the results of the hardware scan.
    # <home-manager/nixos>
    ../../shared/programs.nix
    ../../shared/gtk
    ../../shared/wayland/utilities.nix
  ];
  home.username = "teto";
  home.homeDirectory = "/home/teto";
  # home-manager.users.teto = { pkgs, ... }: {
  home.packages = with pkgs; [
    helvum
    easyeffects
    nextcloud-client
    obsidian
    firefox
    signal-desktop
    ripgrep
    xterm
    webcord
    # obs-studio
    # pkgs.gh
    xdg-desktop-portal-hyprland
    lmstudio # for LLM
    legendary-gl # epic games alternative
    # wineWowPackages.stagingFull # windows emulation
    # winetricks
    # protontricks
    # dxvk_2
    vulkan-tools

    slurp # screen region capture
    grim # screen capture - grab image
    wl-clipboard # wayland clipboard
    jq # Lightweight and flexible command-line JSON processor
    swappy # Wayland native snapshot and editor tool
  ];

  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];
    };
  };

  programs.obs-studio = {
    enable = true;
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

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
