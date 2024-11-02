{pkgs, ...}: {
  imports = [
    ./browsers

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
