{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules
    ../../modules/languages.nix

    ../../modules/darwin
    ../../nixos/common
    ../../nixos/darwin
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.flokkq = {
    description = "flokkq";
    home = lib.mkForce "/Users/flokkq";
  };
  system.primaryUser = "flokkq";

  nix.settings.trusted-users = ["flokkq"];

  system.stateVersion = 5;
}
