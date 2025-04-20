{pkgs ? (import ./nixpkgs.nix) {}}:
pkgs.mkShell {
  buildInputs = with pkgs;
    [
      gnupg
      pkgs.git-cliff

      nushell
      just
      pre-commit
      deadnix
      act
      trufflehog
      ripsecrets
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    ];
}
