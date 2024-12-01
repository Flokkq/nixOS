{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "SketchyBarLua";
  version = "main"; # Use a specific tag or commit hash if desired.

  src = pkgs.fetchFromGitHub {
    owner = "FelixKratz";
    repo = "SbarLua";
    rev = "main"; # Replace with a specific commit or tag for stability.
    sha256 = "sha256-F0UfNxHM389GhiPQ6/GFbeKQq5EvpiqQdvyf7ygzkPg=";
  };

  buildInputs = [pkgs.makeWrapper pkgs.lua pkgs.gcc pkgs.readline];
  installPhase = ''
    export INSTALL_DIR=$out/share/lua/5.4
    make install INSTALL_DIR=$INSTALL_DIR
  '';
}
