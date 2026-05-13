{
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  stylix.targets.waybar = {
    enable = true;
    addCss = false;
  };

  programs.waybar = {
    enable = true;

    style =
      ''
        @define-color base00 ${colors.base00};
        @define-color base01 ${colors.base01};
        @define-color base02 ${colors.base02};
        @define-color base03 ${colors.base03};
        @define-color base04 ${colors.base04};
        @define-color base05 ${colors.base05};
        @define-color base06 ${colors.base06};
        @define-color base07 ${colors.base07};

        @define-color red     ${colors.base08};
        @define-color orange  ${colors.base09};
        @define-color yellow  ${colors.base0A};
        @define-color green   ${colors.base0B};
        @define-color cyan    ${colors.base0C};
        @define-color blue    ${colors.base0D};
        @define-color magenta ${colors.base0E};
        @define-color brown   ${colors.base0F};
      ''
      + builtins.readFile ./styles.css;

    settings = [
      {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        "gtk-layer-shell" = true;
        height = 0;

        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray"
          "custom/updates"
          "hyprland/language"
          "pulseaudio"
          "pulseaudio#microphone"
          "clock"
        ];

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "on-click" = "activate";

          "active-only" = false;
          "persistent-workspaces" = {
            "*" = [1 2 3 4 5 6 8 9];
          };
        };

        "hyprland/language" = {
          format = "{}";
          "format-en" = "US";
          "format-ru" = "RU";
          "format-ka" = "GE";
        };

        "hyprland/window" = {
          "format" = "{}";
          max-length = 60;
          ellipsize = "end";
        };

        tray = {
          "icon-size" = 16;
          spacing = 10;
        };

        clock = {
          format = " {:%R  %d/%m}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          "format-muted" = " Muted";
          "on-click" = "${pkgs.pamixer}/bin/pamixer -t";
          "on-scroll-up" = "${pkgs.pamixer}/bin/pamixer -i 5";
          "on-scroll-down" = "${pkgs.pamixer}/bin/pamixer -d 5";
          "scroll-step" = 5;
          "format-icons" = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          "format-source" = "🎙{volume}%";
          "format-source-muted" = "🎙Muted";
          "on-click" = "${pkgs.pamixer}/bin/pamixer --default-source -t";
          "on-scroll-up" = "${pkgs.pamixer}/bin/pamixer --default-source -i 5";
          "on-scroll-down" = "${pkgs.pamixer}/bin/pamixer --default-source -d 5";
          "scroll-step" = 5;
        };
      }
    ];
  };
}
