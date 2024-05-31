{ config, lib, pkgs, ... }:

{
  imports = [
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [
    waybar
    swww
    dolphin
    wofi
    hyprpaper
  ];

  # Uncomment the following line if needed
  # systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      # MONITORS
      monitor=HDMI-A-1,1920x1080@74.97,auto,auto
      monitor=DP-2,2560x1440@143.86,auto,auto
      monitor=HDMI-A-2,1920x1080@74.97,auto,auto

      # ENVIRONMENT VARIABLES
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      # INPUT
      input {
          follow_mouse = 1

          sensitivity = 0

          touchpad {
              natural_scroll = false
          }
      }

      # LOOK AND FEEL
      general {
          gaps_in = 5
          gaps_out = 20
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          resize_on_border = false
          allow_tearing = false
          layout = dwindle
      }

      decoration {
          rounding = 10
          active_opacity = 1.0
          inactive_opacity = 1.0

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)

          blur {
              enabled = true
              size = 3
              passes = 1
              vibrancy = 0.1696
          }
      }

      animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_is_master = true
      }

      misc {
          force_default_wallpaper = -1
          disable_hyprland_logo = false
      }

      gestures {
          workspace_swipe = false
      }

      # AUTOSTART
      exec-once = kitty
      exec-once = nm-applet &
      exec-once = waybar & hyprpaper & brave

      # KEYBINDINGS
      $mainMod = SUPER

      bind = $mainMod, Q, exec, kitty
      bind = $mainMod, C, killactive,
      bind = $mainMod, E, exec, dolphin
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, space, exec, wofi --show drun
      bind = $mainMod, P, pseudo,

      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      windowrulev2 = suppressevent maximize, class:.*
    '';
  };

  home.file.".config/hypr/colors".text = ''
    $background = rgba(1d192bee)
    $foreground = rgba(c3dde7ee)

    $color0 = rgba(1d192bee)
    $color1 = rgba(465EA7ee)
    $color2 = rgba(5A89B6ee)
    $color3 = rgba(6296CAee)
    $color4 = rgba(73B3D4ee)
    $color5 = rgba(7BC7DDee)
    $color6 = rgba(9CB4E3ee)
    $color7 = rgba(c3dde7ee)
    $color8 = rgba(889aa1ee)
    $color9 = rgba(465EA7ee)
    $color10 = rgba(5A89B6ee)
    $color11 = rgba(6296CAee)
    $color12 = rgba(73B3D4ee)
    $color13 = rgba(7BC7DDee)
    $color14 = rgba(9CB4E3ee)
    $color15 = rgba(c3dde7ee)
  '';
}
