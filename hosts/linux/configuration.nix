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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Virtualisation
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.podman = {
    enable = true;
  };

  programs.virt-manager.enable = true;

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable GVfs
  services.gvfs.enable = true;

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = [
    pkgs.nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = [
  ];

  environment.sessionVariables = {
    # Session variables can be added here if needed
  };

  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  system.stateVersion = "24.05";
}
