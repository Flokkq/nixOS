_: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;

    settings = {
      theme = "catppuccin-mocha";
      font-size = "11";
      font-family = "Hack Nerd Font";
      cursor-style = "block";
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

      macos-window-shadow = false;
      macos-titlebar-style = "hidden";
    };
  };
}
