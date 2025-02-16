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

  xdg.portal.wlr.enable = true;
  programs.xwayland.enable = true;
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;
  environment.systemPackages = with pkgs; [
    wofi
    # glibc
    # gnutls
    # jansson
    bottles
    # wineWowPackages.waylandFull
    winetricks
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    # wineWowPackages.stagingFull
    wineWowPackages.stable
    protonup-qt
    protonplus
    # xdg-desktop-portal-gtk
    # lutris-free
    (lutris.override {
      extraPkgs = pkgs: [
        #       #               ----
        #       #      ↓ same var ↑
        #       #     ----
        wineWowPackages.stable
        # wineWowPackages.stagingFull
        # winePackages.waylandFull
        driversi686Linux.amdvlk
        #       #     # pkgs.wineWowPackages.waylandFull
        #       #     # pkgs.wineWow64Packages.waylandFull
        #       #     # pkgs.winePackages.waylandFull
        #       #
        # glibc
        # gnutls
        # jansson

        winetricks
        #       #     # pkgs.dxvk_2 # Vulkan redirect for DX
        #       #     vulkan-loader
        #       #     vulkan-validation-layers
        #       #     vulkan-extension-layer
        #       #
      ];
    })
  ];
  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
    rocmPackages.clr.icd
  ];
  # For 32 bit applications
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk

  ];
  programs.steam.protontricks.enable = true;
  programs.steam.enable = true;
  hardware.amdgpu.amdvlk.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.amdvlk.support32Bit.enable = true;
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
