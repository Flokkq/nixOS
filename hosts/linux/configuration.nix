{
  inputs,
  meta,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin

    ../../modules
    ../../modules/linux
    ../../modules/languages.nix
    ../../modules/unfree.nix
    ../../modules/yubikey.nix

    ../../nixos/common
    ../../nixos/common/containers/docker.nix

    ../../nixos/linux
    ../../nixos/linux/media/pipewire.nix

    # TODO: fix drivers
    # ../../nixos/linux/hardware/gpu/nvidia.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."flokkq" = {
    isNormalUser = true;
    description = meta.hostname;
    hashedPassword = "$6$roAT/Ee8qQqCf88u$33jo8ikm2KdYNMvv88YJQUFXhNEo8P6Gm2pLRqGKgUCz/E0.TcYeG58duD7DlnvH6prqxXh42jmjyFIzxyOk90";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };
  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "24.05";
}
