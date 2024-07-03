{config, pkgs, ... }:

{
  imports = [
    ./browsers.nix
    ./communication.nix
    ./devtools.nix
  ];


  home.packages = with pkgs; [
    spotify
    _1password-gui
  ];
}
