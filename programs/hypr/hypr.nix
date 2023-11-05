{ pkgs, config, ... }:
let
  wallpaper_path = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/AngelJumbo/gruvbox-wallpapers/main/wallpapers/minimalistic/gruvbox_astro.jpg";
    hash = "sha256-YTxyI+vaC5CGQzqMm1enfPh9/1YoqNXAX7TmAscz1U0=";
  };
in {
  # Hyprpaper config
  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf" = {
    text = ''
preload = ${wallpaper_path}
wallpaper = ,${wallpaper_path}
'';
    onChange = ''
echo "Hyprpaper: Restarting"
${pkgs.killall}/bin/killall hyprpaper -q >/dev/null 2>&1 && nohup ${pkgs.hyprpaper}/bin/hyprpaper >/dev/null 2>&1 &
'';
      };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
