{ config, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      os-rebuild = "sudo nixos-rebuild switch";
      home-switch = "home-manager switch";
      hc = "cd ~/.config/home-manager";
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
