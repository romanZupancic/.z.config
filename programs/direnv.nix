{ config, ... }:
{
  programs.direnv = {
    enable = true;
    enableZshIntegration = config.programs.zsh.enable;
    enableBashIntegration = config.programs.bash.enable;
    nix-direnv.enable = true;
  };
}
