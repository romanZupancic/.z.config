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

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    
    package = pkgs.capitaine-cursors-themed;
    size = 24;
    name="Capitaine Cursors (Gruvbox)";
  };
}
