let
  catppuccinColors = {
    primary = {
      background = "#1E1E2E";
      foreground = "#CDD6F4";
      dim_foreground = "#7f849C";
      bright_foreground = "#CDD6F4";
    };
    cursor = {
      text = "#1E1E2E";
      cursor = "#F5E0DC";
    };
    selection = {
      text = "#1E1E2E";
      background = "#F5E0DC";
    };
    url = "#F5E0DC";
    border = {
      active = "#B4BEFE";
      inactive = "#6C7086";
      bell = "#F9E2AF";
    };
    titlebar = {
      wayland = "#1E1E2E";
      macos = "#1E1E2E";
    };
    tab_bar = {
      active_foreground = "#11111B";
      active_background = "#CBA6F7";
      inactive_foreground = "#CDD6F4";
      inactive_background = "#181825";
      background = "#11111B";
    };
    mark = {
      mark1_foreground = "#1E1E2E";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";
      mark3_background = "#74C7EC";
    };
    normal = {
      black = "#45475A";
      red = "#F38BA8";
      green = "#A6E3A1";
      yellow = "#F9E2AF";
      blue = "#89B4FA";
      magenta = "#F5C2E7";
      cyan = "#94E2D5";
      white = "#BAC2DE";
    };
    bright = {
      black = "#585B70";
      red = "#F38BA8";
      green = "#A6E3A1";
      yellow = "#F9E2AF";
      blue = "#89B4FA";
      magenta = "#F5C2E7";
      cyan = "#94E2D5";
      white = "#A6ADC8";
    };
  };
in
  catppuccinColors
