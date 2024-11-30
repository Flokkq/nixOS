{
  meta,
  lib,
  ...
}: let
  wallpaperConfig = lib.concatStringsSep "\n" (map (
      monitor: "wallpaper = ${monitor.name},${toString ../../../wallpapers/wallhaven-rrljjq.jpg}"
    )
    meta.monitors);
in {
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${toString ../../../wallpapers/wallhaven-rrljjq.jpg}
    ${wallpaperConfig}
  '';
}
