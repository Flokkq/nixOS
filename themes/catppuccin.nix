{ lib ? import ./lib.nix }:
lib.makeTheme {
  name = "catppuccin";
  colors = {
    fg = "#cdd6f4";
    bg = "#1e1e2e";
    bg1 = "#313244";
    bg2 = "#45475a";
    bg3 = "#585b70";
    red = "#f38ba8";
    green = "#a6e3a1";
    yellow = "#f9e2af";
    blue = "#89b4fa";
    purple = "#cba6f7";
    aqua = "#94e2d5";
    orange = "#fab387";
    gray = "#7f849c";
    border = "#6c7086";
    accent = "#b4befe";
    error = "#f38ba8";
    warning = "#fab387";
    success = "#a6e3a1";
    info = "#89dceb";
  };
}
