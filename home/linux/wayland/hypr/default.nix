{
  meta,
  lib,
  ...
}: let
  monitorUtils = import ./utils.nix {inherit lib;};
in {
  imports = [
    ./hyprland-environment.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    settings = {
      monitor = monitorUtils.generateHyprlandMonitorConfig meta.monitors;

      # ENVIRONMENT VARIABLES
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # INPUT
      input = {
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      # LOOK AND FEEL
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "0xaae2e2e3";
        "col.inactive_border" = "0xaa414550";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      gestures = {
        workspace_swipe = false;
      };

      # AUTOSTART
      exec-once = [
        "systemctl --user start hyprland-session.target"
        "nm-applet &"
        "sudo mount -a"
        "swww init"
        "waybar &"
        "hyprpaper --config ~/.config/hypr/hyprpaper.conf &"
        "hypridle --config ~/.config/hypr/hypridle.conf"
        "brave"
        "kitty"
      ];

      # Keybindings
      "$mainMod" = "SUPER";

      bind =
        [
          "$mainMod, E, exec,  wofi --show drun"
          "$mainMod SHIFT, C, exec, exit"
          "$mainMod SHIFT, N, exec, swaync-client -rs && swaync-client -t"
          "$mainMod, Q, exec, kitty"
          "$mainMod, C, killactive"
          "$mainMod, B, exec, chrome"
          "$mainMod, D, exec, vesktop"
          "$mainMod, N, exec, nautilus"
          "$mainMod, S, exec, spotify"
          "$mainMod, P, exec, 1password"

          # Window Management
          "$mainMod, P, pseudo"
          "$mainMod SHIFT, I, togglesplit"
          "$mainMod, M, fullscreen, 1"
          "$mainMod SHIFT, M, fullscreen, 0"

          # Workspace Navigation with Mouse
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

          # Other
          "$mainMod, ENTER, togglespecialworkspace"
          "$mainMod SHIFT, ENTER, movetoworkspace,special"
        ]
        ++ lib.concatMap (n: [
          # Dynamically generate workspace bindings
          "$mainMod, ${toString n}, workspace, ${toString n}"
          "$mainMod SHIFT, ${toString n}, movetoworkspace, ${toString n}"
        ]) (lib.range 1 9)
        # Thats not even cleaner smh my head
        ++ lib.concatMap (dir: [
          "$mainMod, ${dir.k}, movefocus, ${dir.d}"
          "$mainMod SHIFT, ${dir.k}, movewindow, ${dir.d}"
        ]) [
          {
            k = "H";
            d = "l";
          }
          {
            k = "L";
            d = "r";
          }
          {
            k = "K";
            d = "u";
          }
          {
            k = "J";
            d = "d";
          }
          {
            k = "Left";
            d = "l";
          }
          {
            k = "Right";
            d = "r";
          }
          {
            k = "Up";
            d = "u";
          }
          {
            k = "Down";
            d = "d";
          }
        ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      windowrule = [
        "float,class:.waypaper-wrapped"
      ];
    };

    extraConfig = ''
      # additional non-Nix-configurable settings
    '';
  };
}
