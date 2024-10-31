{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs =
    [
      pkgs.gnupg
      pkgs.git-cliff

      pkgs.nushell
      pkgs.just
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    ];
}
