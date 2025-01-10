{
  pkgs,
  inputs,
  lib,
  meta,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules
    ../../modules/languages.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = meta.hostname;
  networking.computerName = meta.hostname;
  system.defaults.smb.NetBIOSName = meta.hostname;

  nix.settings.trusted-users = ["flokkq"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };

  nixpkgs.overlays = [
    (_final: prev: {
      sbar-lua = prev.callPackage ../../pkgs/darwin/sbar-lua.nix {inherit pkgs;};
    })
  ];

  system.activationScripts.postUserActivation.text = ''
    echo >&2 "Switching wallpapers..."
    /usr/local/bin/desktoppr "${meta.wallpaper}"
  '';

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    sketchybar-app-font
  ];

  nix.package = pkgs.nix;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.flokkq = {
    description = "flokkq";
    home = lib.mkForce "/Users/flokkq";
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

  system.stateVersion = 5;
}
