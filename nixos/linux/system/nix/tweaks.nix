# Nix-Specific Tweaks Configuration
_: {
  system.autoUpgrade = {
    enable = false;
    channel = "nixos";
    # Daily @6pm
    dates = "18:00";
    allowReboot = false;
  };

  # <https://nixos.org/manual/nixpkgs/unstable/#chap-packageconfig>
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowUnsupportedSystem = false;
    # allowlistedLicenses = with lib.licenses; [ amd ];
    # blocklistedLicenses = with lib.licenses; [ wtfpl ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
