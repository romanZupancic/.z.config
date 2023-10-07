{
  description = "Home Manager configuration of romanz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nur.url = "github:nix-community/NUR";

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Helpers
      getNixInDir = import ./helpers/getNixInDir.nix {lib = nixpkgs.lib;};
    in {
      homeConfigurations."romanz" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          inputs.nix-colors.homeManagerModules.default
        ] ++ (getNixInDir (./. + "/programs"));
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
