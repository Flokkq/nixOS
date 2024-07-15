{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ./system.nix
    ./apps.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "MacBook-Pro-von-Clemens";
  networking.computerName = "MacBook-Pro-von-Clemens";
  system.defaults.smb.NetBIOSName = "MacBook-Pro-von-Clemens";

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

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.clemensweber = import ./home.nix;
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
