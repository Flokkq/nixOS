{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.default
    # inputs.catppuccin.nixosModules.catppuccin

    ../../../modules
    ../../../modules/linux
    ../../../modules/languages.nix
    ../../../modules/unfree.nix
    ../../../modules/yubikey.nix

    ../../../nixos/common
    ../../../nixos/common/containers/docker.nix

    ../../../nixos/linux
    ../../../nixos/linux/media/pipewire.nix

    ../../../nixos/linux/hardware/gpu/nvidia.nix
  ];

  system.stateVersion = "24.05";
}
