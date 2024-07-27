{ pkks, ... }:

{
  imports = [
    ./terminals
    ./direnv.nix
    ./git.nix
    ./zellij.nix
  ];

  home.packages = with pkks; [
    cava
  ];
}
