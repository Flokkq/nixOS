{
  config,
  pkgs,
  ...
}: let
  colors = import ./terminal-catppuccin-mocha-color-scheme.nix;
in {
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      font_size = 11;
      cursor_shape = "Block";
      cursor_underline_thickness = 1;
      window_padding_width = 10;
      url_style = "curly";
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "always";
      initial_window_width = 1200;
      initial_window_height = 600;

      foreground = colors.primary.foreground;
      background = colors.primary.background;
      selection_foreground = colors.selection.text;
      selection_background = colors.selection.background;
      cursor = colors.cursor.cursor;
      cursor_text_color = colors.cursor.text;
      url_color = colors.url;
      active_border_color = colors.border.active;
      inactive_border_color = colors.border.inactive;
      bell_border_color = colors.border.bell;
      wayland_titlebar_color = colors.titlebar.wayland;
      macos_titlebar_color = colors.titlebar.macos;

      active_tab_foreground = colors.tab_bar.active_foreground;
      active_tab_background = colors.tab_bar.active_background;
      inactive_tab_foreground = colors.tab_bar.inactive_foreground;
      inactive_tab_background = colors.tab_bar.inactive_background;
      tab_bar_background = colors.tab_bar.background;

      mark1_foreground = colors.mark.mark1_foreground;
      mark1_background = colors.mark.mark1_background;
      mark2_foreground = colors.mark.mark2_foreground;
      mark2_background = colors.mark.mark2_background;
      mark3_foreground = colors.mark.mark3_foreground;
      mark3_background = colors.mark.mark3_background;

      color0 = colors.normal.black;
      color8 = colors.bright.black;
      color1 = colors.normal.red;
      color9 = colors.bright.red;
      color2 = colors.normal.green;
      color10 = colors.bright.green;
      color3 = colors.normal.yellow;
      color11 = colors.bright.yellow;
      color4 = colors.normal.blue;
      color12 = colors.bright.blue;
      color5 = colors.normal.magenta;
      color13 = colors.bright.magenta;
      color6 = colors.normal.cyan;
      color14 = colors.bright.cyan;
      color7 = colors.normal.white;
      color15 = colors.bright.white;
    };
  };
}
