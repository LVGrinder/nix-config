{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/downgrade-or-upgrade-packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

    in
    # The `specialArgs` parameter passes the
    # non-default nixpkgs instances to other nix modules
    # extraSpecialArgs = {
    # inherit inputs outputs system;
    # To use packages from nixpkgs-stable,
    # we configure some parameters for it first
    # pkgs-unstable = import nixpkgs-unstable {
    # Refer to the `system` parameter from
    # the outer scope recursively
    # inherit system;
    # # To use Chrome, we need to allow the
    # # installation of non-free software.
    # config.allowUnfree = true;
    # };
    # };
    {
      nixosConfigurations = {
        nixos = nixpkgs-unstable.lib.nixosSystem {
          inherit system;
          # inherit extraSpecialArgs;
          specialArgs = { inherit inputs; }; # // extraSpecialArgs;
          modules = [
            ./system/hosts/chrono
            ./system/users/teto

            home-manager.nixosModules.home-manager
            # catppuccin.nixosModules.catppuccin
            {
              home-manager = {
                # inherit extraSpecialArgs;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.teto = import ./home/users/teto;
                extraSpecialArgs = {
                  inherit inputs;
                };
              };
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
              home-manager.sharedModules = [
                inputs.nixcord.homeModules.nixcord
                inputs.catppuccin.homeModules.catppuccin
                inputs.spicetify-nix.homeManagerModules.default
              ];
            }
          ];
        };
      };
    };
}
