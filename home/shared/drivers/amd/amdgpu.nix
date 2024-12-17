{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true; # Enable OpenGL support
    driSupport = true; # Enable Direct Rendering Infrastructure (DRI)
    driSupport32Bit = true; # Enable 32-bit DRI for Steam and other apps
  };

}
