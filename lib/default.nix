inputs: let
  lib = inputs.nixpkgs.lib;
in
  lib
  // rec {
    # Returns all files in a directory matching a suffix
    filesInDirectoryWithSuffix = directory: suffix:
      lib.pipe (lib.filesystem.listFilesRecursive directory) [
        # Get only files ending in .nix
        (builtins.filter (name: lib.hasSuffix suffix name))
      ];

    homeDir = inputs.config.users.users.flokkq.home;
    nixosConfigDir = "${homeDir}/developer/nixOS";
  }
