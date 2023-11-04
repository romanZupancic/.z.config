{ config, pkgs, lib, ... }:
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
        (buildFirefoxXpiAddon {
          pname = "Playback Speed";
          version = "1.4.4";
          addonId = "playbackSpeed@waldemar.b";
          url = "https://addons.mozilla.org/firefox/downloads/file/3864607/playback_speed-1.4.4.xpi";
          sha256 = "sha256-SfGV/gWtoTs5UF8sCqRGMeKH99GaIkIIXnclRD7MHP0=";
          meta = with lib;
            {
              homepage = "https://github.com/WaldiPL/playbackSpeed";
              description = "Increase video playback speed everywhere";
              license = licenses.mit;
              mozPermissions = [ "activeTab" "storage" "scripting" "tabs" "*://*/*" ];
              platforms = platforms.all;
            };
        })
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
