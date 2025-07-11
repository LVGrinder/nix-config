{
  config,
  pkgs,
  ...
}:
{
  programs.xwayland.enable = true;
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.systemPackages = with pkgs; [

    bottles
    winetricks
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    # wineWowPackages.stagingFull
    wineWowPackages.stable
    protonup-qt
    protonplus
    # wineWowPackages.waylandFull
    # xdg-desktop-portal-gtk
    # lutris-free
    # glibc
    # gnutls
    # jansson
  ];
  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
    rocmPackages.clr.icd
  ];
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk

  ];
  # For 32 bit applications
  programs.steam.protontricks.enable = true;
  programs.steam.enable = true;
  hardware.amdgpu.amdvlk.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.amdvlk.support32Bit.enable = true;
}
