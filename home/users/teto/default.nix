
{ config, pkgs, ... }:
{
  home-manager.users.teto = { pkgs, ... }: {
  home.packages = [
    pkgs.firefox
    pkgs.signal-desktop
    pkgs.ripgrep
    pkgs.xterm
    pkgs.webcord
    pkgs.obs-studio
    # pkgs.gh
	];
	



	programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName  = "Daniel Aanensen";
    userEmail = "tetochrono@protonmail.com";
  };
  # programs.gh.enable = true;
  programs.git.extraConfig.github.user = "LVGrinder";

  programs.gh = {
  enable = true;
};

	

	

	home.stateVersion = "25.05";

  };
}
