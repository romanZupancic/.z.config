{ config, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      os-rebuild = "sudo nixos-rebuild switch";
      home-switch = "home-manager switch";
    };
    enableCompletion = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
        "direnv"
      ];
      theme = "robbyrussell";
    };
    
    initExtra = ''
    eval "$(direnv hook zsh)"
    '';
  };
}
