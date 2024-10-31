{
  pkgs,
  inputs,
  lib,
  meta,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = meta.hostname;
  networking.computerName = meta.hostname;
  system.defaults.smb.NetBIOSName = meta.hostname;

  nix.settings.trusted-users = ["clemensweber"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  fonts.packages = [
    pkgs.nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = [
    pkgs.nerdfonts
  ];

  nix.package = pkgs.nix;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clemensweber = {
    description = "clemensweber";
    home = lib.mkForce "/Users/clemensweber";
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Disable auto-optimise-store because of this issue:
  #   https://github.com/NixOS/nix/issues/7273
  # "error: cannot link '/nix/store/.tmp-link-xxxxx-xxxxx' to '/nix/store/.links/xxxx': File exists"
  nix.settings = {
    auto-optimise-store = false;
  };
}
