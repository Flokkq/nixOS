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
    ./sops.nix
    # ./kernel.nix
  ];
}
