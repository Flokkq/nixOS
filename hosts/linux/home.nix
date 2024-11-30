{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

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

  # Set GTK theme for the user
  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = ["normal"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05";
}
