{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
