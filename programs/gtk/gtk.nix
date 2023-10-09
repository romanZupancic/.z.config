{ pkgs, lib, ...}:
{
  gtk = {
    enable = true;
    font = {
      name = "Cascadia Code";
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

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
