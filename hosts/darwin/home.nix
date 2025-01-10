{ ...}: {
  imports = [
    ../../home
    ../../home/darwin
  ];

  # Home Manager needs a bit of information about you and the paths it should
  home.username = "flokkq";
  home.homeDirectory = "/Users/flokkq";

  # TODO: Only available in home-manager???
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
