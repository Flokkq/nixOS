{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
  ];

  home.file.".config/neofetch".source = ./neofetch;
}