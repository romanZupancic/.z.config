{ config, rootPath, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      os-rebuild = "sudo nixos-rebuild switch --flake ${rootPath}";
      home-switch = "home-manager switch --flake ${rootPath}";
      hc = "cd ${rootPath}";
      ":q" = "exit";
    };
    enableCompletion = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
        "direnv"
      ];
      theme = "amuse";
    };
    
    initExtra = ''
    eval "$(direnv hook zsh)"
    '';
  };
}
