{ pkgs, config, ... }:
let
  wallpaper_path = "~/Pictures/wallpapers/spaceman-gruvbox.jpg";
  # wallpaper_path = "~/Pictures/wallpapers/city-gruvbox.png";
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

  home.file.".config/hypr/hyprland.conf".text = (builtins.readFile ./hyprland.conf) + ''
exec-once=hyprctl setcursor "${config.home.pointerCursor.name}" ${toString config.home.pointerCursor.size}
'';
}
