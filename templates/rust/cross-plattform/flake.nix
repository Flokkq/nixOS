{
  description = "Basic cross plattform Rust flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    rust-overlay,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        overlays = [(import rust-overlay)];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
        with pkgs; {
          devShells.default = mkShell rec {
            buildInputs =
              [
                (rust-bin.selectLatestNightlyWith (toolchain:
                  toolchain.default.override {
                    extensions = ["rust-src" "rust-analyzer"];
                    targets = ["x86_64-pc-windows-gnu" "wasm32-unknown-unknown"];
                  }))
                gnupg
                git-cliff
                pre-commit

                gcc
                rustc
                cargo
                cargo-watch
                clippy
                rustfmt
                pkg-config
                openssl
              ]
              ++ lib.optionals pkgs.stdenv.isLinux [
                wineWow64Packages.base
                pkgsCross.mingwW64.buildPackages.gcc
                pkgs.wine64
              ]
              ++ pkgs.lib.optionals pkg.stdenv.isDarwin [
                darwin.apple_sdk.frameworks.SystemConfiguration
              ];

            LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
          };
        }
    );
}
