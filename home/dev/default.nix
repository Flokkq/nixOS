{ pkgs, ... }:

{
  imports = [
    ./shells
    ./editors
    ./btop
    ./zellij
 
    ./git.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];
}
