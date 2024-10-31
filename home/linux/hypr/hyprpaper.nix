{
  pkgs,
  meta,
  lib,
  ...
}: let
  monitorUtils = import ./lib/utils.nix {inherit lib;};
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/nixos-config/home/pictures/_1.png
  '';
}
