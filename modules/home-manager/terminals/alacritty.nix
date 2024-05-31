{ config, pkgs, ... }:

let
  colorScheme = import ./terminal-catppuccin-mocha-color-scheme.nix;
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
    background = "${colorScheme.primary.background}"
    foreground = "${colorScheme.primary.foreground}"
    dim_foreground = "${colorScheme.primary.dim_foreground}"
    bright_foreground = "${colorScheme.primary.bright_foreground}"

  [colors.cursor]
    text = "${colorScheme.cursor.text}"
    cursor = "${colorScheme.cursor.cursor}"

  [colors.selection]
    text = "${colorScheme.selection.text}"
    background = "${colorScheme.selection.background}"

  [colors.normal]
    black = "${colorScheme.normal.black}"
    red = "${colorScheme.normal.red}"
    green = "${colorScheme.normal.green}"
    yellow = "${colorScheme.normal.yellow}"
    blue = "${colorScheme.normal.blue}"
    magenta = "${colorScheme.normal.magenta}"
    cyan = "${colorScheme.normal.cyan}"
    white = "${colorScheme.normal.white}"

  [colors.bright]
    black = "${colorScheme.bright.black}"
    red = "${colorScheme.bright.red}"
    green = "${colorScheme.bright.green}"
    yellow = "${colorScheme.bright.yellow}"
    blue = "${colorScheme.bright.blue}"
    magenta = "${colorScheme.bright.magenta}"
    cyan = "${colorScheme.bright.cyan}"
    white = "${colorScheme.bright.white}"

[bell]
animation = "EaseOutExpo"
duration = 0

[selection]
semantic_escape_chars = ",?`|:\"' ()[]{}<>"
save_to_clipboard = true
'';
}
