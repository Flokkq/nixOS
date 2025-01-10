# keyboard settings is not very useful on macOS
# the most important thing is to remap option key to alt key globally,
# but it's not supported by macOS yet.
_: {
  system.keyboard = {
    enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`

    # NOTE: do NOT support remap capslock to both control and escape at the same time
    remapCapsLockToControl = false; # remap caps lock to control, useful for emac users
    remapCapsLockToEscape = true; # remap caps lock to escape, useful for vim users

    # swap left command and left alt
    # so it matches common keyboard layout: `ctrl | command | alt`
    #
    # disabled, caused only problems!
    swapLeftCommandAndLeftAlt = false;
  };

  system.defaults.CustomUserPreferences.NSGlobalDomain."com.apple.symbolichotkeys" = {
    AppleSymbolicHotKeys = {
      "118" = {
        enabled = true;
        value = {
          parameters = [65535 18 262144];
          type = "standard";
        };
      };
      "119" = {
        enabled = true;
        value = {
          parameters = [65535 19 262144]; # Ctrl+2
          type = "standard";
        };
      };
      "120" = {
        enabled = true;
        value = {
          parameters = [65535 20 262144]; # Ctrl+3
          type = "standard";
        };
      };
      "121" = {
        enabled = true;
        value = {
          parameters = [65535 21 262144]; # Ctrl+4
          type = "standard";
        };
      };
      "122" = {
        enabled = true;
        value = {
          parameters = [65535 23 262144]; # Ctrl+5
          type = "standard";
        };
      };
      "123" = {
        enabled = true;
        value = {
          parameters = [65535 22 262144]; # Ctrl+6
          type = "standard";
        };
      };
      "124" = {
        enabled = true;
        value = {
          parameters = [65535 26 262144]; # Ctrl+7
          type = "standard";
        };
      };
      "125" = {
        enabled = true;
        value = {
          parameters = [65535 28 262144]; # Ctrl+8
          type = "standard";
        };
      };
      "126" = {
        enabled = true;
        value = {
          parameters = [65535 25 262144]; # Ctrl+9
          type = "standard";
        };
      };
    };
  };
}
