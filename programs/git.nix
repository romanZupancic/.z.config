{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-utils # Necessary for git-credential-manager to open a browser
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Roman Zupancic";
    userEmail = "roman.k.zupancic@gmail.com";
    extraConfig = {
      init = {
        defaultBranch="main";
      };
      credential.helper = "${pkgs.nur.repos.mloeper.git-credential-manager}/bin/git-credential-manager";

      credential.credentialStore = "cache";

      http.postBuffer = 157286400;
    };
  };
}
