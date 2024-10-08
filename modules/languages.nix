{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    rustup
    unstable.go_1_22
    air
    nodejs
    yarn
  ];
}
