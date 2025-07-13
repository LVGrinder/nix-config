{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];
hardware.graphics.enable = true;
hardware.nvidia = {
  modesetting.enable = true;
  powerManagement = {
    enable = true;
    finegrained = false;
  };
	open = false;
	nvidiaSettings = true;
package = config.boot.kernelPackages.nvidiaPackages.stable;

};


environment.systemPackages = [
    pkgs.nvidia-vaapi-driver
  ];

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];
environment.sessionVariables.NIXOS_OZONE_WL = "1";

}
