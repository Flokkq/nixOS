{ pkgs, ... }:

{
  imports = [
    ./dev
    ./apps
  ];

  home.packages = with pkgs; [
    nerdfonts
  ];
}
