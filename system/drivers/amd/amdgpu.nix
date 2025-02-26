{ pkgs, ... }:

{
  # Enable OpenGL/Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      # vulkan-loader
      # vulkan-validation-layers
      # vulkan-extension-layer
      # vulkan-volk
      # amdvlk
    ];
    extraPackages32 = with pkgs; [
      # vulkan-loader
      # vulkan-validation-layers
      # vulkan-extension-layer

      # vulkan-volk

      # driversi686Linux.amdvlk
    ];

    # driSupport32Bit = true; # For 32 bit applications

  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  # services.displayManager.sddm.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  # services.displayManager.defaultSession = "hyprland";
  # services.displayManager.autoLogin.user = "teto";

  # hardware.graphics = {
  # };
  # hardware.opengl.driSupport = true; # This is already enabled by default
  #   # hardware.graphics.extraPackages = with pkgs; [
  #   amdvlk
  # vulkan-loader
  # rocmPackages.clr.icd
  # ];
  # For 32 bit applications
}
