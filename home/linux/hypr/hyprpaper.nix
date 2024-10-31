{
  pkgs,
  meta,
  lib,
  ...
}: let
  monitorUtils = import ./lib/utils.nix {inherit lib;};

  # Automatically set wallpaper for each monitor
  wallpaperConfig = lib.concatStringsSep "\n" (map (
      monitor: "wallpaper = ${monitor.name},~/nixos-config/wallpapers/_1.png"
    )
    meta.monitors);
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/nixos-config/wallpapers/_1.png
    ${wallpaperConfig}
  '';
}
