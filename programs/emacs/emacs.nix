{ pkgs, config, rootPath, ... }:
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

  home.file.".config/emacs/config.org" = {
    source = config.lib.file.mkOutOfStoreSymlink "${rootPath}/programs/emacs/config.org";
      onChange = ''
echo "Emacs: Generating init.el"
cd ~/.config/emacs && ${pkgs.emacs}/bin/emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "config.org")'
'';
  };
}
