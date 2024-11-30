{
  pkgs,
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

    ../../nixos/linux
    ../../nixos/linux/media/pipewire.nix
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  xdg.portal.enable = true;

  networking.firewall.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."flokkq" = {
    isNormalUser = true;
    description = meta.hostname;
    hashedPassword = "$6$roAT/Ee8qQqCf88u$33jo8ikm2KdYNMvv88YJQUFXhNEo8P6Gm2pLRqGKgUCz/E0.TcYeG58duD7DlnvH6prqxXh42jmjyFIzxyOk90";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  security.sudo.wheelNeedsPassword = false;

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  fonts.packages = [
    pkgs.nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = [
  ];

  environment.sessionVariables = {
    # Session variables can be added here if needed
  };

  system.stateVersion = "24.05";
}
