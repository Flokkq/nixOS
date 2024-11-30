{...}: {
  imports = [
    ./nix

    ./bootloader.nix
    ./localization.nix
    ./virtualization.nix
    ./services.nix
    ./systemd.nix
    ./hardware.nix
    ./kernel.nix
  ];
}
