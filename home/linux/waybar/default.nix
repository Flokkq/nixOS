{
  pkgs,
  lib,
  ...
}:
with lib; {
  home.packages = with pkgs; [
    waybar

    pavucontrol
    wlogout
    xsensors
    grim
    hyprpicker
    waypaper
    playerctl
  ];

  home.file.".config/waybar/modules" = {
    source = ./modules;
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./styles.css;

    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [
          "custom/weather"
          "clock#date"
          "custom/pacman"
        ];
        modules-left = [
          "custom/rofi"
          "hyprland/workspaces"
          "custom/media"
        ];
        modules-right = [
          "cpu"
          "memory"
          "custom/storage"
          "temperature"
          "network"
          "wireplumber"
          "tray"
          "custom/wallpaper"
          "custom/notification"
          "custom/power"
        ];

        "custom/rofi" = {
          format = " ";
          tooltip = false;
        };

        "battery" = {
          interval = 2;
          states = {
            good = 95;
            warning = 30;
            critical = 5;
          };
          format = "{icon}  {capacity}%";
          format-plugged = "<span foreground='#3C3836'></span> {capacity}%";
          format-icons = {
            default = [
              "<span foreground='#FB4934'></span>"
              "<span foreground='#EA6631'></span>"
              "<span foreground='#DA822D'></span>"
              "<span foreground='#C99F2A'></span>"
              "<span foreground='#B8BB26'></span>"
            ];
            format-charging = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
        };

        "temperature" = {
          interval = 30;
          critical-threshold = 80;
          format-critical = "  {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          format-icons = [
            "<span foreground='#15161E'></span>"
            "<span foreground='#15161E'></span>"
            "<span foreground='#15161E'></span>"
            "<span foreground='#15161E'></span>"
          ];
          max-length = 7;
          min-length = 7;
          on-click = "xsensors";
        };

        "memory" = {
          interval = 30;
          format = "  {used}GB";
          on-click = "kitty -e btop";
        };

        "network" = {
          format-wifi = "<span foreground='#15161E'> </span> {essid}";
          format-ethernet = " {ifname}";
          format-linked = "{ifname} (No IP) ";
          format = "";
          format-disconnected = "<span foreground='#15161E'>󰖪 </span>Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click-right = "wl-copy $(ip address show up scope global | grep inet6 | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c6-)";
          tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
          tooltip-format-wifi = " {essid} {frequency}MHz\nStrength: {signaldBm}dBm ({signalStrength}%)\nIP: {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          interval = 10;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}  {percent}%";
          format-icons = [
            "<span foreground='#15161E'>󰃞</span>"
            "<span foreground='#15161E'>󰃟</span>"
            "<span foreground='#15161E'>󰃠</span>"
          ];
        };

        "custom/storage" = {
          format = "{icon}  {percentage}%";
          format-alt = "  {percentage}%";
          format-alt-click = "click-right";
          return-type = "json";
          interval = 60;
          exec = "~/.config/waybar/modules/storage.sh";
          on-click = "kitty 'df -h'";
        };

        "custom/screenshot" = {
          format = "󰹑";
          on-click = "sleep 0.1 && grim";
          tooltip-format = "Screenshot";
        };

        "custom/color" = {
          format = "";
          on-click = "sleep 0.1 && hyprpicker -a";
          tooltip-format = "Color picker";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = true;
        };

        "custom/weather" = {
          format = "{}";
          format-alt = "{alt}: {}";
          format-alt-click = "click-right";
          interval = 7200;
          tooltip-format = "Outdoor temperature";
          exec = "curl -s 'https://wttr.in/?format=1' | tr -s ' '";
          exec-if = "ping wttr.in -c1";
        };

        "custom/pacman" = {
          format = "<span foreground='#E0AF68'>📦</span> {}";
          interval = 3600;
          exec = "checkupdates | wc -l";
          exec-if = "exit 0";
          on-click = "kitty -e 'paru'; pkill -SIGRTMIN+8 waybar"; # TODO
          signal = 8;
          max-length = 8;
          min-length = 3;
        };

        "custom/media" = {
          format = "{icon} {}";
          return-type = "json";
          max-length = 50;
          format-icons = {
            spotify_player = "<span foreground='#9ECE6A'></span> ";
            default = "<span foreground='#BB9AF7'>🎵</span> ";
          };
          on-click-right = "playerctl --player=spotify_player play-pause";
          on-click = "playerctl --player=mpd play-pause";
          on-scroll-up = "playerctl --player=mpd previous";
          on-scroll-down = "playerctl --player=mpd next";
          escape = true;
          exec-if = "pgrep spotify_player";
          exec = "$HOME/.config/waybar/modules/mediaplayer.py 2> /dev/null";
        };

        "custom/power" = {
          format = "🛑";
          tooltip = true;
          tooltip-format = "Power";
        };

        "clock#date" = {
          format = "<span foreground='#9ECE6A'>🕓</span> {:%H:%M  <span foreground='#9ECE6A'>🗓️</span> %e %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          today-format = "<b>{}</b>";
        };

        "cpu" = {
          interval = 1;
          format = "  {usage}%";
          max-length = 10;
          min-length = 8;
          on-click = "kitty -e btop";
        };

        "tray" = {
          icon-size = 15;
          spacing = 5;
        };

        "custom/wallpaper" = {
          format = "🎨";
          on-click = "sleep 0.1 && waypaper-engine next-image"; # TODO
        };

        "custom/notification" = {
          format = "🔔";
          on-click = "sleep 0.1 && swaync-client -rs && swaync-client -t"; # TODO
          tooltip-format = "Notifications";
        };

        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            active = "";
            default = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
          on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
          sort-by-number = true;
          active-only = false;
          persistent-workspaces = {
            "*" = 4;
          };
        };

        "hyprland/window" = {
          max-length = 100;
          separate-outputs = true;
        };

        "pulseaudio" = {
          scroll-step = 3;
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
          on-click-right = "amixer sset Master toggle";
        };

        "wireplumber" = {
          on-click = "sleep 0.1 && pavucontrol";
          on-click-right = "amixer sset Master toggle 1>/dev/null";
          format = "{icon} {volume}%";
          format-muted = "<span foreground='#15161E'>󰖁 </span>Mute";
          format-source = "";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              "<span foreground='#15161E'> </span>"
              "<span foreground='#15161E'> </span>"
              "<span foreground='#15161E'> </span>"
              "<span foreground='#15161E'> </span>"
              "<span foreground='#15161E'> </span>"
            ];
          };
        };
      }
    ];
  };
}
