{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./starship.nix
  ];
}
