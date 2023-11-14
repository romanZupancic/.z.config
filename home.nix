{ config, pkgs, inputs, lib, rootPath, ... }:

{
  nixpkgs.overlays = [
    inputs.nur.overlay
  ];
  
  home.stateVersion = "22.11";

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  home.username = "romanz";
  home.homeDirectory = "/home/romanz";
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home.sessionVariables = {
    EDITOR = "emacsclient -c";
    PAGER = "${pkgs.most}/bin/most";
  };

  home.shellAliases = {
    # Nix Configuration
    hc = "cd ${rootPath}";
    os-rebuild = "sudo nixos-rebuild switch --flake ${rootPath}";
    home-switch = "home-manager switch --flake ${rootPath}";

    # Because I'm always vimming
    ":q" = "exit";

    # Better ls
    ls = "${pkgs.exa}/bin/exa";
    ll = "ls -l";
    l = "ls -la";
    lg = "${pkgs.exa}/bin/exa --long --header --git";
  };

  # Manage XDG variables
  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      createDirectories = true;

      documents = "${config.home.homeDirectory}/Documents";
      desktop = null;
      music = null;
      videos = null;
      publicShare = null;
      templates = null;

      extraConfig = {
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
        XDG_SCHOOL_DIR = "${config.home.homeDirectory}/School";
        XDG_WORK_DIR = "${config.home.homeDirectory}/Work";
      };
    };
  };

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

    asciiquarium

    xdg-utils

    unstable.logseq

    vlc
  ];
}
