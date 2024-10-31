{...}: {
  imports = [
    ../../home
    ../../home/darwin
  ];

  # Home Manager needs a bit of information about you and the paths it should
  home.username = "clemensweber";
  home.homeDirectory = "/Users/clemensweber";

  home.packages = [];

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

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05";
}
