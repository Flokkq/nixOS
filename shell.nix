{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs =
    [
      pkgs.gnupg
      pkgs.git-cliff

      pkgs.nushell
      pkgs.just
      pkgs.pre-commit
      pkgs.deadnix
      pkgs.act
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    ];
}
