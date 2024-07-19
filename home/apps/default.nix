{ pkgs, ... }:

{
  imports = [
    ./browsers
    ./communication

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
