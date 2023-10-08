{ pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify-tui
    spotify
  ];

  services.spotifyd = {
    enable = true;
    # device_name = "nix";
  };
}
