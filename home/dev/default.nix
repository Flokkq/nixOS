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
    ./direnv.nix
    ./vscode.nix
    ./lazygit.nix
  ];

  home.packages = with pkgs; [
    pipes-rs
  ];
}
