#  macOS's System configuration
#
# All the configuration options are documented here:
#  https://daiderd.com/nix-darwin/manual/index.html#sec-options
# Incomplete list of macOS `defaults` commands :
#  https://github.com/yannbertrand/macos-defaults
_: {
  imports = [
    ./nix

    ./activation.nix
    ./services.nix
    ./localization.nix
    ./dock.nix
    ./finder.nix
    ./trackpad.nix
    ./login.nix
    ./keyboard.nix
  ];
}
