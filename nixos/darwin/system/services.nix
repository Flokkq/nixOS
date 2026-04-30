# Services Configuration
{pkgs, ...}: let
  sketchybarLua = pkgs.lua5_5.withPackages (_: [pkgs.sbarlua]);
in {
  nix.enable = true;

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = [sketchybarLua];
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
