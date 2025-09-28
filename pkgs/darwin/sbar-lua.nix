# https://github.com/DavSanchez/nix-dotfiles/blob/a948422e0ee6a284f7413f7d5f7e8065cc131bb6/pkgs/sbarlua.nix
{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "sbar-lua";
  version = "unstable-2024-08-12";

  src = fetchFromGitHub {
    owner = "FelixKratz";
    repo = "SbarLua";
    rev = "437bd2031da38ccda75827cb7548e7baa4aa9978";
    hash = "sha256-F0UfNxHM389GhiPQ6/GFbeKQq5EvpiqQdvyf7ygzkPg=";
  };

  nativeBuildInputs = with pkgs; [clang gnumake];
  buildInputs = with pkgs; [readline gcc];

  NIX_LDFLAGS =
    lib.optionalString stdenv.hostPlatform.isDarwin
    "-framework CoreFoundation";

  makeFlags = lib.optionals stdenv.hostPlatform.isDarwin ["CC=cc"];

  buildPhase = ''
    make bin/sketchybar.so
  '';

  installPhase = ''
    mkdir -p $out/lib
    mv bin/sketchybar.so $out/lib/sketchybar.so
  '';

  meta = {
    description = "A Lua API for SketchyBar";
    homepage = "https://github.com/FelixKratz/SbarLua";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [davsanchez];
    mainProgram = "sbar-lua";
    platforms = lib.platforms.darwin;
  };
}
