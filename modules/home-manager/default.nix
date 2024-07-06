{ pkgs, ... }:

{
  imports = [
    ./dev
    ./apps
    ./hypr
    ./waybar
  ];

  home.packages = with pkgs; [
    nerdfonts
  ];
}
