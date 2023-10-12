{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = (pkgs.nerdfonts.override {fonts = ["CascadiaCode"];});
      name = "CascadiaCode";
      size = 12;
    };

    settings = with config.colorScheme.colors; {
      cursor_shape = "block";

      #####
      # COLORS
      #####
      background_opacity = "0.9";

      foreground           = "#${base06}";
      background           = "#${base00}";
      selection_foreground = "#${base00}";
      selection_background = "#${base06}";

      #: Cursor colors
      cursor            = "#${base06}";
      cursor_text_color = "#${base00}";
    
      #: URL underline color when hovering with mouse
      url_color = "#458588";
      
      
      #: kitty window border colors and terminal bell colors
      
      # active_border_color             #00ff00
      # inactive_border_color           #cccccc
      # bell_border_color               #ff5a00
      # visual_bell_color               none
      
      
      #: OS Window titlebar colors
      
      # wayland_titlebar_color          system
      # macos_titlebar_color            system
      
      
      #: Tab bar colors
      
      # active_tab_foreground           #000
      # active_tab_background           #eee
      # inactive_tab_foreground         #444
      # inactive_tab_background         #999
      # tab_bar_background              none
      # tab_bar_margin_color            none
      
      
      #: Colors for marks (marked text in the terminal)
      
      # mark1_foreground black
      # mark1_background #98d3cb
      # mark2_foreground black
      # mark2_background #f2dcd3
      # mark3_foreground black
      # mark3_background #f274bc
      
      
      #: The basic 16 colors
      
      #: black
      color0 = "#${base00}";
      # color8 = "#${base08}";
      
      #: red
      color1 = "#${base08}";
      # color9 = "#000000";
      
      #: green
      color2  = "#${base0B}";
      # color10 = "#${base0A}";
      
      #: yellow
      color3  = "#${base09}";
      # color11 = "#${base0B}";
      
      #: blue
      color4  = "#${base0D}"; 
      # color12 = "#${base0C}"; 
      
      #: magenta
      color5  = "#${base0E}"; 
      # color13 = "#${base0D}"; 
      
      #: cyan
      color6  = "#${base0C}"; 
      # color14 = "#${base0E}"; 
      
      #: white
      color7  = "#${base06}"; 
      # color15 = "#${base0F}"; 
    };
    
    #shellIntegration.enableZshIntegration = true;
    #shellIntegration.mode = "no-cursor";
  };
}
