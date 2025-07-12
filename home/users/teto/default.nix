{
  config,
  pkgs,
  ...
}:
{

  imports = [
    # Include the results of the hardware scan.
    # <home-manager/nixos>
    ../../shared
    ../../shared/gtk
    ../../shared/wayland/utilities.nix
    ./spicetify.nix
  ];
  home.username = "teto";
  home.homeDirectory = "/home/teto";
  # home-manager.users.teto = { pkgs, ... }: {
  home.packages = with pkgs; [
    playerctl
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
    dorion
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true; # Vesktop
    # dorion.enable = true; # Dorion
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];
    };
    # dorion = {
    #   theme = "catppuccin-mocha";
    #   zoom = "1.1";
    #   # blur = "acrylic"; # "none", "blur", or "acrylic"
    #   # sysTray = true;
    #   # openOnStartup = true;
    #   autoClearCache = true;
    #   disableHardwareAccel = false;
    #   # rpcServer = true;
    #   # rpcProcessScanner = true;
    #   # pushToTalk = true;
    #   # pushToTalkKeys = [ "RControl" ];
    #   desktopNotifications = true;
    #   unreadBadge = true;
    # };
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

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

}
