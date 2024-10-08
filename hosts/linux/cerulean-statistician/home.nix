{ pkgs, meta, ... }:
{
  imports = [
    ../../../home
    ../../../home/linux
  ];

  # Home Manager needs a bit of information about the user and paths
  home.username = meta.hostname;
  home.homeDirectory = meta.hostname;

  # Home Manager release information
  targets.genericLinux.enable = true;

  home.activation = {
    linkDesktopApplications = {
      after = [ "writeBoundary" "createXdgUserDirectories" ];
      before = [ ];
      data = '''';
    };
  };

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.11";

  home.packages = [
    # Add your home packages here if needed
    # (import ../../scripts/linux { inherit pkgs; })
  ];

  home.file = {
    # You can define files or dotfiles to be managed here
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "neovim";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Set GTK theme for the user
  gtk = {
    enable = true;

    # Optionally, enable Catppuccin theme
    # catppuccin = {
    #   enable = true;
    #   flavor = "mocha";
    #   accent = "pink";
    #   size = "standard";
    #   tweaks = [ "normal" ];
    # };

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
}
