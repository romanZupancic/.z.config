{ config, ...}:
{
  programs.zathura = {
    enable = true;

    options = {
      default-fg = "#${config.colorScheme.colors.base06}";
      default-bg = "#${config.colorScheme.colors.base00}";
      font = "Cascadia Code";

      recolor = true;
      recolor-keephue = true;
      recolor-darkcolor = "#${config.colorScheme.colors.base06}";
      recolor-lightcolor = "#${config.colorScheme.colors.base00}";
      selection-clipboard = "clipboard";
    };
  };
}
