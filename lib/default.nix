{
  inputs,
  pkgs,
}: let
  lib = inputs.nixpkgs.lib;
  tlib = import ../themes/default.nix {inherit lib pkgs;};
in
  lib
  // rec {
    filesInDirectoryWithSuffix = directory: suffix:
      lib.pipe (lib.filesystem.listFilesRecursive directory) [
        builtins.filter
        (name: lib.hasSuffix suffix name)
      ];

    getTheme = name: let
      themeName =
        if name != null
        then name
        else lib.warn "meta.theme not set" (builtins.head tlib.names);
    in
      tlib.get themeName;

    homeDir = inputs.config.users.users.flokkq.home;
    nixosConfigDir = "${homeDir}/developer/nixOS";
  }
