{
  lib,
  pkgs,
  ...
}: {
  # swaync is a notification daemon
  services = {
    swaync = {
      enable = true;
      settings = {
        "$schema" = "${pkgs.swaynotificationcenter}/etc/xdg/swaync/configSchema.json";
        notification-inline-replies = true;
        positionX = "right";
        positionY = "top";
        widgets = [
          "buttons-grid"
          "title"
          "dnd"
          "notifications"
          "mpris"
          "volume"
        ];
        widget-config = {
          buttons-grid.actions = [
            {
              label = "󰹑";
              command = "${lib.getExe pkgs.grimblast} save screen - | ${lib.getExe pkgs.swappy} -f -";
            }
            {
              label = "󱩌";
              command = "${lib.getExe pkgs.notify-desktop} NightLight";
            }
            {
              label = "󰍹";
              command = "${lib.getExe pkgs.wdisplays}";
            }
            {
              label = "";
              command = "${lib.getExe pkgs.gnome-usage}";
            }
            {
              label = "󰀝";
              command = "${lib.getExe pkgs.notify-desktop} AirplaneMode";
            }
            {
              label = "󰐥";
              command = "pidof ${lib.getExe pkgs.hyprlock} || ${lib.getExe pkgs.hyprlock}";
            }
          ];
          title = {
            text = "Notifications";
            clear-all-button = true;
            button-text = "󰩹";
          };
          dnd = {
            text = "Do Not Disturb";
          };
          mpris = {
            blur = true;
          };
          volume = {
            label = "󰓃";
            show-per-app = false;
          };
        };
      };
      # https://github.com/catppuccin/swaync
      # 0.2.3 (mocha)
      style = builtins.readFile ./mocha.css;
    };
  };
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "CTRL ALT, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client --toggle-panel --skip-wait"
      ];
    };
  };
}
