{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wev # Tool for checking which keys on button press
  ];
}
