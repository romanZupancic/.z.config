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
