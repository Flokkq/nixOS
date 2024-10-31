{pkgs, ...}: {
  imports = [
    ./dev
    ./apps

    ./kanata.nix
  ];

  home.packages = with pkgs; [
    nerdfonts
  ];
}
