{ pkgs, ... }:
let
  emacs_package = pkgs.emacs;
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
