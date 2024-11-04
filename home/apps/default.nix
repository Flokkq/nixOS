{pkgs, ...}: {
  imports = [
    ./browsers
    ./music

    ./zathura.nix
  ];

  home.packages = with pkgs; [
    wireshark
    postman
    jetbrains.idea-ultimate
  ];
}
