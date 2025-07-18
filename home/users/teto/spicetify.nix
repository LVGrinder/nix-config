{
  config,
  pkgs,
  inputs,
  ...
}:

let
  # For Flakeless:
  # spicePkgs = spicetify-nix.packages;

  # With flakes:
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
