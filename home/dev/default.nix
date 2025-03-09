{...}: {
  imports = [
    ./shells
    ./editors
    # ./zellij
    ./neofetch
    ./bat
    ./yazi

    ./git.nix
    ./tmux.nix
    ./zoxide.nix
    ./direnv.nix
    ./lazygit.nix
    ./btop.nix
  ];
}
