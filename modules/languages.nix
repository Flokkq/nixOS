{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    rustup
    go_1_24
    air
    nodejs
    yarn
    nil
    alejandra
    bash-language-server
  ];
}
