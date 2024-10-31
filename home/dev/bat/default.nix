{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    bat
  ];

  home.file.".config/bat/themes/mocha.tmTheme".source = ./mocha.tmTheme;

  home.sessionVariables = {
    BAT_THEME = "mocha"; # Set the theme name as "mocha"
  };

  # TODO: bat to system.environmentPackages
  # home.activation = {
  #   configureBat = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #     bat cache --build
  #   '';
  # };
}
