{
  pkgs,
  meta,
  lib,
  ...
}: let
  monitorUtils = import ./lib/utils.nix {inherit lib;};

  # Automatically set wallpaper for each monitor
  wallpaperConfig = lib.concatStringsSep "\n" (map (
      monitor: "wallpaper = ${monitor.name},${toString ../../../wallpapers/wallhaven-rrljjq.jpg}"
    )
    meta.monitors);
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${toString ../../../wallpapers/wallhaven-rrljjq.jpg}
    ${wallpaperConfig}
  '';
}
