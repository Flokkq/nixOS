_: {
  programs.ghostty = {
    enable = true;
    package = null;
    enableZshIntegration = true;
    # installVimSyntax = true;

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
  };
}
