{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/nixos-config/home/pictures/bridge.png
    wallpaper = HDMI-A-1,~/nixos-config/home/pictures/bridge.png
    wallpaper = DP-2,~/nixos-config/home/pictures/bridge.png
    wallpaper = HDMI-A-2,~/nixos-config/home/pictures/bridge.png
  '';
}
