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
}
