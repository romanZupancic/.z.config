{ config, ... }:
{
  programs.alacritty = {
    enable = false;
    settings = {
      window.padding = {
        x = 5;
        y = 5;
      };
      
      window.opacity = 0.9;
      
      font.normal.family = "CascadiaCode";
      font.size = 12;
      
      colors = {
        bright = {
          black = "0x${config.colorScheme.colors.base00}";
          blue = "0x${config.colorScheme.colors.base0D}";
          cyan = "0x${config.colorScheme.colors.base0C}";
          green = "0x${config.colorScheme.colors.base0B}";
          magenta = "0x${config.colorScheme.colors.base0E}";
          red = "0x${config.colorScheme.colors.base08}";
          white = "0x${config.colorScheme.colors.base06}";
          yellow = "0x${config.colorScheme.colors.base09}";
        };
        cursor = {
          cursor = "0x${config.colorScheme.colors.base06}";
          text = "0x${config.colorScheme.colors.base00}";
        };
        normal = {
          black = "0x${config.colorScheme.colors.base00}";
          blue = "0x${config.colorScheme.colors.base0D}";
          cyan = "0x${config.colorScheme.colors.base0C}";
          green = "0x${config.colorScheme.colors.base0B}";
          magenta = "0x${config.colorScheme.colors.base0E}";
          red = "0x${config.colorScheme.colors.base08}";
          white = "0x${config.colorScheme.colors.base06}";
          yellow = "0x${config.colorScheme.colors.base09}";
        };
        primary = {
          background = "0x${config.colorScheme.colors.base00}";
          foreground = "0x${config.colorScheme.colors.base06}";
        };
      };
    };
  };
}
