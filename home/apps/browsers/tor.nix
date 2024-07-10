{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tor
  ];
}

