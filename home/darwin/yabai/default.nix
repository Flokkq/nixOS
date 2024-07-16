{ config, lib, pkgs, ... }:

{
  services.yabai = {
    enable = true;

    # Whether to enable yabai's scripting-addition.
    # SIP must be disabled for this to work.
    # https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection
    enableScriptingAddition = true;
    # config = {};
    extraConfig = builtins.readFile ./yabairc;
  };
}
