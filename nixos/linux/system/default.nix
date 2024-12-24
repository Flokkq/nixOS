{...}: {
  imports = [
    ./nix

    ./bootloader.nix
    ./localization.nix
    ./virtualization.nix
    ./services.nix
    ./systemd.nix
    ./hardware.nix
    ./impermanence.nix
    # ./kernel.nix
  ];
}
