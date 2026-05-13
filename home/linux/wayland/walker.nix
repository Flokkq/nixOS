{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "stylix";

      placeholders."default" = {
        input = "Search";
        list = "Example";
      };

      providers.prefixes = [
        {
          provider = "websearch";
          prefix = "+";
        }
        {
          provider = "providerlist";
          prefix = "_";
        }
        {
          provider = "1password";
          prefix = ";";
        }
      ];
    };
  };

  xdg.configFile."walker/themes/stylix/style.css".text = ''
    @define-color window_bg_color ${colors.base00};
    @define-color accent_bg_color ${colors.base0D};
    @define-color theme_fg_color ${colors.base05};
    @define-color error_bg_color ${colors.base08};
    @define-color error_fg_color ${colors.base00};

    * {
      all: unset;
      font-family: "Hack Nerd Font";
    }

    popover {
      background: lighter(@window_bg_color);
      border: 1px solid darker(@accent_bg_color);
      border-radius: 0px;
      padding: 10px;
    }

    .box-wrapper {
      background: @window_bg_color;
      padding: 20px;
      border-radius: 0px;
      border: 1px solid darker(@accent_bg_color);
    }

    .preview-box,
    .elephant-hint,
    .placeholder {
      color: @theme_fg_color;
    }

    .input {
      caret-color: @theme_fg_color;
      background: lighter(@window_bg_color);
      padding: 10px;
      color: @theme_fg_color;
    }

    .input selection {
      background: alpha(@accent_bg_color, 0.35);
    }

    .list {
      color: @theme_fg_color;
    }

    .item-box {
      border-radius: 0px;
      padding: 10px;
    }

    .item-quick-activation {
      background: alpha(@accent_bg_color, 0.25);
      border-radius: 0px;
      padding: 10px;
    }

    child:selected .item-box,
    row:selected .item-box {
      background: alpha(@accent_bg_color, 0.25);
    }

    .item-subtext {
      font-size: 12px;
      opacity: 0.5;
    }

    .preview {
      border: 1px solid alpha(@accent_bg_color, 0.25);
      border-radius: 0px;
      color: @theme_fg_color;
    }

    .keybinds {
      padding-top: 10px;
      border-top: 1px solid lighter(@window_bg_color);
      font-size: 12px;
      color: @theme_fg_color;
    }

    .keybind-button {
      opacity: 0.5;
    }

    .keybind-bind {
      text-transform: lowercase;
      opacity: 0.35;
    }

    .keybind-label {
      padding: 2px 4px;
      border-radius: 0px;
      border: 1px solid @theme_fg_color;
    }

    .error {
      padding: 10px;
      background: @error_bg_color;
      color: @error_fg_color;
    }
  '';

  programs.elephant = {
    enable = true;

    providers = [
      "bluetooth"
      "bookmarks"
      "calc"
      "clipboard"
      "desktopapplications"
      "files"
      "menus"
      "providerlist"
      "runner"
      "snippets"
      "symbols"
      "todo"
      "unicode"
      "websearch"
      "windows"
      "1password"
    ];
  };
}
