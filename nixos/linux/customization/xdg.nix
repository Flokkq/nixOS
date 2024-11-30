# XDG Configuration
{pkgs, ...}: {
  # Necessary for GTK apps
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;

    # Keep the behaviour in < 1.17, which uses the first
    # portal implementation found in lexicographical order
    config.common.default = "*"; # Use the first portal implementation found

    # Needed to run Hyperland on NixOS properly
    #- <https://wiki.hyprland.org/Nix/Hyprland-on-NixOS>
    extraPortals = with pkgs; [
      xdg-desktop-portal
    ];

    # Not needed on X11
    #- Both -wlr and -hyprland installed at once will cause conflicts: <https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal>
    wlr.enable = false;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };
}
