{ config, rootPath, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    historyControl = [ "ignoredups" ];
  };

  programs.starship = {
    enable = config.programs.bash.enable;
  };
}
