{ config, ... }:
{
  programs.zsh = {
    enable = false;
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
