{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-material
    ];
    extraConfig =''
set tabstop=4
set softtabstop=-1
set shiftwidth=4
set expandtab
set smartindent
 
set number
set relativenumber

colorscheme gruvbox-material

highlight Normal ctermbg=none
highlight NonText ctermbg=none
'';
  };
}
