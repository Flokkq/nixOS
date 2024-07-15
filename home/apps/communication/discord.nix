{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO: split into linux & darwin
    discord
  ];
}
