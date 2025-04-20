{pkgs, ...}: {
  xsession.windowManager.bspwm = {
    enable = true;

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
      "${pkgs.picom}/bin/picom"
      "${pkgs.sxhkd}/bin/sxhkd"
      "${pkgs.kitty}/bin/kitty"
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
      # "${pkgs.polybar}/bin/polybar main"
    ];

    extraConfig = ''
      sudo mount -a
    '';
  };

  home.file.".xinitrc".text = ''
    exec bspwm
    xsetroot -cursor_name left_ptr
  '';
}
