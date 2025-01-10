# Services Configuration
{pkgs, ...}: {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };
}
