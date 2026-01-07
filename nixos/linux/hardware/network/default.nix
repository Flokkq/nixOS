{...}: {
  imports = [
    ./internet.nix
    ./bluetooth.nix

    # conflicts with ./internet.nix
    # ./wifi.nix
  ];
}
