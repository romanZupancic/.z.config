{ config, pkgs, inputs, lib, ... }:

{
  nixpkgs.overlays = [
    inputs.nur.overlay
  ];

  home.username = "romanz";
  home.homeDirectory = "/home/romanz";
  
  home.stateVersion = "22.11";

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  
  home.sessionVariables = {
    EDITOR = "emacsclient -c";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Manage XDG variables
  xdg.enable = true;

  nixpkgs.config.allowUnfreePredicate = _ : true;
  home.packages = with pkgs; [
    thefuck

    # Discord
    (discord.override {
      withOpenASAR = true;
    })
    betterdiscordctl # run `betterdiscordctl install`

    imagemagick

    bat
  ];
  
  gtk = {
    enable = true;
    font = {
      name = "Cascadia Code";
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

  home.pointerCursor =
    let
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
        "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
        "Fuchsia-Pop";
}
