{ config, ... }:
{
  programs.eww = {
    enable = false;
    configDir = ./bar;
  };
}
