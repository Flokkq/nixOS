{pkgs ? (import ../../nixpkgs.nix) {}, ...}: {
  sbar-lua = pkgs.callPackage ./sbar-lua.nix {};
}
