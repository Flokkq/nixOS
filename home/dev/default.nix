{pkgs, ...}: {
  imports = [
    ./shells
    ./editors
    ./btop
    ./zellij
    ./neofetch
    ./bat
    ./yazi

    ./git.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    lazygit
    pipes-rs
  ];
}
