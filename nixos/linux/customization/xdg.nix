# XDG Configuration
{...}: let
  hyprlandPortalConfig = {
    default = ["hyprland" "gtk"];
    "org.freedesktop.impl.portal.FileChooser" = "gtk";
    "org.freedesktop.impl.portal.RemoteDesktop" = "hyprland";
    "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
  };
in {
  # Necessary for GTK apps
  xdg.portal = {
    enable = true;

    config = {
      common = hyprlandPortalConfig;
      hyprland = hyprlandPortalConfig;
    };

    # Not needed on X11
    #- Both -wlr and -hyprland installed at once will cause conflicts: <https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal>
    wlr.enable = false;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "ghostty.desktop"
      ];
    };
  };
}
