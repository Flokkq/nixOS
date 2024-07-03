{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerdfonts
  ];
}

