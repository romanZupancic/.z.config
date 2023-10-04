{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.roman = {
      isDefault = true;
      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "Quercus";
              url = "https://q.utoronto.ca";
              tags = ["school"];
            }
          ];
        }
      ];
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
        gruvbox-dark-theme
      ];
      settings = {
        "signon.rememberSignons" = false;
        "extensions.activeThemeID" = "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}";
        "browser.theme.content-theme" = 0;
        "browser.theme.toolbar-theme" = 0;
      };
    };
  };
}
