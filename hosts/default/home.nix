{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

 # Home Manager needs a bit of information about you and the paths it should
  home.username = "flokkq";
  home.homeDirectory = "/home/flokkq";

  # This value determines the Home Manager release that your configuration is
  targets.genericLinux.enable = true;
  home.activation = {
    linkDesktopApplications = {
      after = [ "writeBoundary" "createXdgUserDirectories" ];
      before = [ ];
      data = '''';
    };  
  };


  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "23.11";

  home.packages = [
    (import ../../scripts/list-hypr-bindings.nix { inherit pkgs; })
    (import ../../scripts/theme-selector.nix { inherit pkgs; })
    (import ../../scripts/task-waybar.nix { inherit pkgs; })
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
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

  # Set GTK theme for user
  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
