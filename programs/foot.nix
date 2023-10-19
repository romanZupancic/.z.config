{ config, ...}:
{
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        term = "xterm-256color";
        font = "CascadiaCode:size=13";
      };

      cursor = {
        color = with config.colorScheme.colors; "${base00} ${base06}";
      };

      colors = with config.colorScheme.colors; {
        background = "${base00}";
        foreground = "${base06}";

        regular0 = "${base00}";
        regular1 = "${base08}";
        regular2 = "${base0B}";
        regular3 = "${base09}";
        regular4 = "${base0D}";
        regular5 = "${base0E}";
        regular6 = "${base0C}";
        regular7 = "${base06}";

        bright0 = "${base00}";
        bright1 = "${base08}";
        bright2 = "${base0B}";
        bright3 = "${base09}";
        bright4 = "${base0D}";
        bright5 = "${base0E}";
        bright6 = "${base0C}";
        bright7 = "${base06}";

        alpha = 0.9;
      };
    };
  };
}
