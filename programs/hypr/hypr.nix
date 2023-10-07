{ pkgs, ... }:
let
  wallpaper_path = "~/Pictures/wallpapers/evergreen-forest.png";
in {
  # Hyprpaper config
  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf".text = ''
preload = ${wallpaper_path}
wallpaper = ,${wallpaper_path}
'';

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
