{ pkgs, lib, ...}:
{
  gtk = {
    enable = true;
    font = {
      name = "Cascadia Code";
    };
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = ./gtk.css;
  home.file.".config/gtk-3.0/gtk.css".source = ./gtk.css;

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 24;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ${pkgs.unzip}/bin/unzip ${url} -d $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        ./capitaine-cursors-gruvbox.zip
        "sha256-ipPpmZKU/xLA45fdOvxVbtFDCUsCYIvzeps/DjhFkNg="
        "capitaine-cursors-gruvbox";
}
