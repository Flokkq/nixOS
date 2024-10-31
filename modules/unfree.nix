{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) (
      map lib.getName [
        pkgs.discord
        pkgs.steam
        pkgs.steam-run
        pkgs.steam-original
        pkgs.obsidian
        pkgs.slack
      ]
    );

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs; [
    discord
    obsidian
    slack
  ];
}
