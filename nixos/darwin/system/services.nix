# Services Configuration
{pkgs, ...}: {
  nix.enable = true;

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };

  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
  };

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    package = pkgs.yabai;
    config.extraConfig = builtins.readFile ../../../home/darwin/wm/yabairc;
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = builtins.readFile ../../../home/darwin/wm/skhdrc;
  };
}
