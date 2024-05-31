
{ config, pkgs, ... }:

let
  colorScheme = import ./terminal-catppuccin-mocha-color-scheme.nix;
in {
  home.packages = with pkgs; [
    kitty
  ];
}

