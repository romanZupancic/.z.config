{ config, pkgs, ... }:
{
  programs.lf = {
    enable = true;
    
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
printf "Directory Name: "
read DIR
mkdir $DIR
}}
'';
    };
    
    keybindings = {
      "." = "set hidden!";
      ee = "editor-open";
      
      "g~" = "cd";
      "g/" = "/";
      
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox-dark "$f"'';
    };
    
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };
}
