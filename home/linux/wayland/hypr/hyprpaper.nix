{
  meta,
  lib,
  ...
}: let
  wallpaperConfig = lib.concatStringsSep "\n" (map (
      monitor: "wallpaper = ${monitor.name},${meta.theme.wallpaper}"
    )
    meta.monitors);
in {
  # home.file.".config/hypr/hyprpaper.conf".text = ''
  #   preload = ${meta.theme.wallpaper}
  #   ${wallpaperConfig}
  # '';
}
