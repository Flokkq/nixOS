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
    # rpi-imager -- currently broken
    wireshark
    # ghidra
    # burpsuite
  ];
}
