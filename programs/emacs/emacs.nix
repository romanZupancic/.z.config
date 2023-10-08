{ pkgs, ... }:
let
  emacs_package = pkgs.emacs29-gtk3;
in
{
  services.emacs = {
    enable = true;
    package = emacs_package;
  };

  programs.emacs = {
    enable = true;
    package = emacs_package;
  };
}
