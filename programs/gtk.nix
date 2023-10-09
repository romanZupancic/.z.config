{ pkgs, ...}:
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
              mkdir -p "$out/share/icons/${name}"
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
                stripRoot = false;
              }}/"${name}"/* "$out/share/icons/${name}"
              touch "$out/share/icons/${name}/cursor.theme"
              echo '[Icon Theme]' > "$out/share/icons/${name}/cursor.theme" 
              echo 'Name=${name}' >> "$out/share/icons/${name}/cursor.theme" 
              echo 'Inherits="${name}"' >> "$out/share/icons/${name}/cursor.theme" 
          '';
        };
    in
      getFrom 
        "https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip"
        "sha256-ipPpmZKU/xLA45fdOvxVbtFDCUsCYIvzeps/DjhFkNg="
        "Capitaine Cursors (Gruvbox)";
}
