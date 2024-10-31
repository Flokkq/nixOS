{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../home
    ../../home/linux
  ];

  # Home Manager needs a bit of information about the user and paths
  home.username = "flokkq";
  home.homeDirectory = lib.mkForce "/home/flokkq";

  home.enableNixpkgsReleaseCheck = false;
  targets.genericLinux.enable = true;

  home.activation = {
    linkDesktopApplications = {
      after = ["writeBoundary" "createXdgUserDirectories"];
      before = [];
      data = '''';
    };
  };

  # Set global font configurations
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["Hack nerd Font"];
      sansSerif = ["Hack nerd Font"];
      serif = ["Hack nerd Font"];
    };
  };

  # Set GTK theme for the user
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.11";
}
