{...}: {
  imports = [
    ./shells
    ./editors
    ./btop
    # ./zellij
    ./neofetch
    ./bat
    ./yazi

    ./git.nix
    ./tmux.nix
    ./zoxide.nix
    ./direnv.nix
    ./lazygit.nix
  ];
}
