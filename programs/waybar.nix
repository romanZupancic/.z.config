{ config, ... }:
{
  programs.waybar = {
    enable = false;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = [
          "clock"
          "custom/weather"
          "wlr/workspaces"
        ];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray"
          "battery"
          "backlight"
          "pulseaudio"
          # "pulseaudio#microphone"
        ];
        "hyprland/window" = {
          format = "{}";
        };
        "wlr/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
          "//format" = "{icon}";
          persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
        };
        "custom/weather" = {
          tooltip = true;
          format = "{}";
          interval = 30;
          exec = "~/.config/waybar/scripts/waybar-wttr.py";
          return-type = "json";
        };
        tray = {
          icon-size = 13;
          spacing = 10;
        };
        clock = {
          format = "{: %R   %d/%m}";
          tooltip-format = "<big>{:%A %d}</big>\n<tt><small>{calendar}</small></tt>";
        };
        backlight = {
          device = "amdgpu_bl1";
          format = "{icon} {percent}%";
          format-icons = [""];
          on-scroll-up = "brightnessctl set 1%+ -d amdgpu_bl0";
          on-scroll-down = "brightnessctl set 1%- -d amdgpu_bl0";
          min-length = 6;
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [""];
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
      };
    };
  };
}
