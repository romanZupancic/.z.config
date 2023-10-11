{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = (nerdfonts.override {fonts = ["CascadiaCode"];});
      name = "Cascadia Code";
      size = 12;
    };

    #theme = "gruvbox";

    shellIntegration.enableZshIntegration = true;
  };
}
