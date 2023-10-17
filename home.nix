{ config, pkgs, inputs, lib, rootPath, ... }:

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
    PAGER = "${pkgs.most}/bin/most";
  };

  home.shellAliases = {
    os-rebuild = "sudo nixos-rebuild switch --flake ${rootPath}";
    home-switch = "home-manager switch --flake ${rootPath}";
    hc = "cd ${rootPath}";
    ":q" = "exit";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Manage XDG variables
  xdg.enable = true;

  home.packages = with pkgs; [
    thefuck

    # Discord
    (discord.override {
      withOpenASAR = true;
    })
    betterdiscordctl # run `betterdiscordctl install`

    imagemagick

    bat
    most

    bottles

    man-pages man-pages-posix
  ];
}
