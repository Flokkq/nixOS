{
  meta,
  lib,
  ...
}: let
  wallpaperConfig = lib.concatStringsSep "\n" (map (
      monitor: "wallpaper = ${monitor.name},${meta.wallpaper}"
    )
    meta.monitors);
in {
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${meta.wallpaper}
    ${wallpaperConfig}
  '';
}
