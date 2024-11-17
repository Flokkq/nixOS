{pkgs, ...}: {
  imports = [
    ./brave.nix
    ./schizofox.nix
  ];

  home.packages = with pkgs; [
    google-chrome
  ];
}
