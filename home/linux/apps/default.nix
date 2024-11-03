{...}: {
  imports = [
    ./communication
    ./music
    ./browsers
  ];

  home.packages = with pkgs; [
    _1password-gui
    rpi-imager
    wireshark
    ghidra
    burpsuite
  ];
}
