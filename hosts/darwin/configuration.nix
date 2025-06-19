{
  pkgs,
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

  # TODO: fix overlays
  nixpkgs.overlays = [
    (_final: prev: {
      sbar-lua = prev.callPackage ../../pkgs/darwin/sbar-lua.nix {inherit pkgs;};
    })
  ];

  system.stateVersion = 5;
}
