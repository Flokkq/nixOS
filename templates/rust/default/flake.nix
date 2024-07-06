{
  description = "Basic Rust flake";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        packages.default = rust-bin.selectLatestNightlyWith(toolchain: toolchain.default.override {
          extensions= [ "rust-src" "rust-analyzer" ];
          targets = [];
        });

        devShells.default = mkShell rec {
          buildInputs = [
            packages.default
            pkg-config
            openssl
            bunyan-rs
          ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
            darwin.apple_sdk.frameworks.SystemConfiguration
          ];

          LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
        };
      }
    );
}
