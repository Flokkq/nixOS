{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vencord
  ];
}
