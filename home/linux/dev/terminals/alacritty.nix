{
  config,
  pkgs,
  ...
}: let
  colors = import ./terminal-catppuccin-mocha-color-scheme.nix;
in {
  home.packages = with pkgs; [
    alacritty
  ];

  home.file.".config/alacritty/alacritty.toml".text = ''
    [env]
    TERM = "xterm-256color"

    [window]
    dimensions = { columns = 0, lines = 0 }
    startup_mode = "Maximized"
    padding = { x = 2, y = 2 }
    decorations = "none"
    dynamic_title = true
    opacity = 1

    [colors]
      [colors.primary]
        background = "${colors.primary.background}"
        foreground = "${colors.primary.foreground}"
        dim_foreground = "${colors.primary.dim_foreground}"
        bright_foreground = "${colors.primary.bright_foreground}"

      [colors.cursor]
        text = "${colors.cursor.text}"
        cursor = "${colors.cursor.cursor}"

      [colors.selection]
        text = "${colors.selection.text}"
        background = "${colors.selection.background}"

      [colors.normal]
        black = "${colors.normal.black}"
        red = "${colors.normal.red}"
        green = "${colors.normal.green}"
        yellow = "${colors.normal.yellow}"
        blue = "${colors.normal.blue}"
        magenta = "${colors.normal.magenta}"
        cyan = "${colors.normal.cyan}"
        white = "${colors.normal.white}"

      [colors.bright]
        black = "${colors.bright.black}"
        red = "${colors.bright.red}"
        green = "${colors.bright.green}"
        yellow = "${colors.bright.yellow}"
        blue = "${colors.bright.blue}"
        magenta = "${colors.bright.magenta}"
        cyan = "${colors.bright.cyan}"
        white = "${colors.bright.white}"

    [bell]
    animation = "EaseOutExpo"
    duration = 0

    [selection]
    semantic_escape_chars = ",?`|:\"' ()[]{}<>"
    save_to_clipboard = true
  '';
}
