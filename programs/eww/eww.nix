{ config, ... }:
{
  programs.eww = {
    enable = true;
    configDir = ./bar;
  };
}
