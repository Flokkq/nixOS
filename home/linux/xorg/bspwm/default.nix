{pkgs, ...}: {
  xsession.windowManager.bspwm = {
    enable = true;

    extraConfig = ''
      # Launch polybar
      ${pkgs.polybar}/bin/polybar main &

      # Start sxhkd
      ${pkgs.sxhkd}/bin/sxhkd &
    '';

    settings = {
      border_width = 2;
      window_gap = 10;
      top_padding = 2;
      bottom_padding = 8;
      left_padding = 8;
      right_padding = 8;
      split_ratio = 0.50;
      auto_balance = false;
      focus_follows_pointer = true;
      pointer_follows_monitor = true;
    };

    rules = {
      "Gimp" = {
        desktop = "^2";
        state = "floating";
        follow = true;
      };
    };

    startupPrograms = [
      "${pkgs.sxhkd}/bin/sxhkd"
      "${pkgs.polybar}/bin/polybar main"
    ];
  };
}
