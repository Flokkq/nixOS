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

${colorScheme}

[bell]
animation = "EaseOutExpo"
duration = 0

[selection]
semantic_escape_chars = ",?`|:\"' ()[]{}<>"
save_to_clipboard = true
'';
}

