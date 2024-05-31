{ config, pkgs, ... }:

let
  colors = import ./terminal-catppuccin-mocha-color-scheme.nix;
in
{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      font_size = 13;
      cursor_underline_thickness = 1;
      window_padding_width = 10;
      url_style = "curly";
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      shell = "${pkgs.tmux}/bin/tmux";
      initial_window_width = 1200;
      initial_window_height = 600;

      background = colors.primary.background;
      foreground = colors.primary.foreground;
      dim_foreground = colors.primary.dim_foreground;
      bright_foreground = colors.primary.bright_foreground;

      cursor = colors.cursor.cursor;
      cursor_text_color = colors.cursor.text;

      selection_foreground = colors.selection.text;
      selection_background = colors.selection.background;

      color0 = colors.normal.black;
      color1 = colors.normal.red;
      color2 = colors.normal.green;
      color3 = colors.normal.yellow;
      color4 = colors.normal.blue;
      color5 = colors.normal.magenta;
      color6 = colors.normal.cyan;
      color7 = colors.normal.white;

      color8 = colors.bright.black;
      color9 = colors.bright.red;
      color10 = colors.bright.green;
      color11 = colors.bright.yellow;
      color12 = colors.bright.blue;
      color13 = colors.bright.magenta;
      color14 = colors.bright.cyan;
      color15 = colors.bright.white;
    };
  };
}
