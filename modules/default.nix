{pkgs, ...}: {
  imports = [
    ./dev.nix
    ./apps.nix
  ];
  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
