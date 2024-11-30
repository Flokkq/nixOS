{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    rustup
    go_1_22
    air
    nodejs
    yarn
    nil
  ];
}
