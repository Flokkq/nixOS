{
  lib,
  pkgs,
  ...
}: let
  settings = {
    # theme = "catppuccin-mocha";
    font-size = 12;
    font-family = ["Monaco" "Hack Nerd Font"];
    font-thicken = true;
    font-thicken-strength = 150;
    cursor-style = "block";
    cursor-style-blink = false;
    cursor-invert-fg-bg = false;
    cursor-color = "lightgrey";
    cursor-text = "black";
    shell-integration-features = ["no-cursor"];
    scrollback-limit = 100000;

    custom-shader-animation = true;
    mouse-hide-while-typing = true;
    working-directory = "inherit";
    window-inherit-working-directory = true;
    copy-on-select = true;
    quit-after-last-window-closed = true;
    confirm-close-surface = false;
    app-notifications = false;
    desktop-notifications = false;
    window-decoration = false;

    # macos-window-shadow = false;
    macos-titlebar-style = "hidden";
  };

  ghosttyFormat = pkgs.formats.keyValue {
    listsAsDuplicateKeys = true;
    mkKeyValue = lib.generators.mkKeyValueDefault {} " = ";
  };
in {
  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.hostPlatform.isDarwin
      then null
      else pkgs.ghostty;

    enableZshIntegration = true;
    # installVimSyntax = true;

    inherit settings;
  };

  home.file."Library/Application Support/com.mitchellh.ghostty/config" = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    source = ghosttyFormat.generate "ghostty-config" settings;
  };
}
