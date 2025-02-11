{
  config,
  pkgs,
  ...
}:

{
  programs = {
    waybar.enable = true;
  };
  # environment.systemPackages = [
  #   pkgs.bottles
  #   pkgs.wofi
  #   pkgs.winePackages.waylandFull
  #
  # ];

  environment.systemPackages = with pkgs; [
    wofi
    bottles
    wineWowPackages.waylandFull
    winetricks

    # (lutris-unwrapped.override {
    #   extraPkgs = pkgs: [
    #     #               ----
    #     #      ↓ same var ↑
    #     #     ----
    #     wineWowPackages.waylandFull
    #     # pkgs.wineWowPackages.waylandFull
    #     # pkgs.wineWow64Packages.waylandFull
    #     # pkgs.winePackages.waylandFull
    #
    #     winetricks
    #     # pkgs.dxvk_2 # Vulkan redirect for DX
    #     vulkan-loader
    #     vulkan-validation-layers
    #     vulkan-extension-layer
    #
    #   ];
    # })
  ];
  programs.steam.enable = true;
  hardware.amdgpu.amdvlk.enable = true;
  #OBS
  # https://nixos.wiki/wiki/OBS_Studio
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  # services.xserver.videoDrivers = [
  #   "amdgpu"
  # ];
}
