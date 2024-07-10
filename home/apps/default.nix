{ pkgs, ... }:

{
  imports = [
    ./browsers
    ./communication
    ./music

    ./zathura.nix
  ];


  home.packages = with pkgs; [
    _1password-gui
    rpi-imager
    wireshark
    ghidra
    burpsuite
  ];
}
