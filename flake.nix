{
  description = "Roman Zupancic's nixos & home-manager configuration";

  inputs = {
    # Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nur.url = "github:nix-community/NUR"; # Community packages

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Colours and theming
    nix-colors.url = "github:misterio77/nix-colors";

    # Spotify theming & customization
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      # Necessary for symlinks to files within the configuration repository
      home-manager-root = "/home/romanz/.z.config";

      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

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
        extraSpecialArgs = {
          inherit inputs;
          rootPath = "${home-manager-root}";
        };
      };

      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [ ./nixos/configuration.nix ];
      };
    };
}
