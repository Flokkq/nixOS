_: {
  programs.wofi = {
    enable = true;
    # style = ./style.css;

    settings = {
      show = "drun";
      prompt = ">";
      normal_window = true;
      layer = "overlay";
      term = "foot";
      columns = 1;

      width = "25%";
      height = "30%";
      location = "center";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = true;

      allow_markup = false;
      allow_images = false;
      image_size = 35;

      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      "run-always_parse_args" = true;

      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;

      key_expand = "Tab";
      key_exit = "Escape";
    };
  };
}
