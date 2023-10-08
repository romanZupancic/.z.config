{
  description = "Home Manager configuration of romanz";

  inputs = {
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nur.url = "github:nix-community/NUR"; # Community packages

    # Colours and theming
    nix-colors.url = "github:misterio77/nix-colors";

    # Spotify theming & customization
    spicetify-nix.url = "github:the-argus/spicetify-nix";
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
          inputs.spicetify-nix.homeManagerModules.default
          inputs.nix-colors.homeManagerModules.default
          ./home.nix
        ] ++ (getNixInDir (./. + "/programs"));
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
