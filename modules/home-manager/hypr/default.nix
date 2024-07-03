{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
    ./colors.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    swww
    dolphin
    wofi
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    settings = {
      # MONITORS
      monitor = [
        "HDMI-A-1,1920x1080@74.97,auto,auto"
        "DP-2,2560x1440@143.86,auto,auto"
        "HDMI-A-2,1920x1080@74.97,auto,auto"
      ];

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
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
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

      master = {
        new_is_master = true;
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

      bind = [
        # Launch Applications
        "$mainMod, SPACE, exec,  wofi --show drun"
        "$mainMod SHIFT, SPACE, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, W, exec, web-search"
        "$mainMod SHIFT, N, exec, swaync-client -rs"
        "$mainMod, W, exec, brave"
        "$mainMod, S, exec, screenshootin"
        "$mainMod, D, exec, discord"
        "$mainMod, N, exec, dolphin"
        "$mainMod, M, exec, spotify"
        "$mainMod SHIFT, C, exec, exit"
      
        # Window Management
        "$mainMod, P, pseudo"
        "$mainMod SHIFT, I, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod SHIFT, F, fullscreen"
      
        # Move Focus
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod, Left, movefocus, l"
        "$mainMod, Right, movefocus, r"
        "$mainMod, Up, movefocus, u"
        "$mainMod, Down, movefocus, d"

        # Move Windows
        "$mainMod SHIFT, Left, movewindow, l"
        "$mainMod SHIFT, Right, movewindow, r"
        "$mainMod SHIFT, Up, movewindow, u"
        "$mainMod SHIFT, Down, movewindow, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
      
        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      
        # Workspace Navigation with Mouse
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
       
        # Other      
        "$mainMod, ENTER, togglespecialworkspace"
        "$mainMod SHIFT, ENTER, movetoworkspace,special"

        "ALT, TAB, exec, cyclenext & bringactivetotop"
      ];
      
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
    };

    extraConfig = ''
      # additional non-Nix-configurable settings
    '';
  };

}
