{ pkgs, ... }:

{
  imports = [
    ./shells
    ./editors
    ./btop
    ./zellij
    ./neofetch
 
    ./git.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    lazygit
    pipes-rs
  ];
}
