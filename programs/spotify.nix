{ pkgs, inputs, ...}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  home.packages = with pkgs; [
    # spotify
    spotify-tui
  ];

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "roman.k.zupancic@gmail.com";
        password_cmd = "sh /home/romanz/.config/spotify-password.sh";
        use_keyring = true;
        device_name = "Nixos Spotifyd";
      };
    };
  };

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes."Onepunch";
    colorScheme = "flamingo";

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      fullAppDisplay
    ];
  };
}
