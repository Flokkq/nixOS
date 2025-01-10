{
  meta,
  pkgs,
  ...
}: {
  nix.package = pkgs.nix;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  networking.hostName = meta.hostname;
  networking.computerName = meta.hostname;
  system.defaults.smb.NetBIOSName = meta.hostname;
}
