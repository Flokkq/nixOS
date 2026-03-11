{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    eza
    oh-my-zsh
    zsh
    starship
    fzf
    ripgrep
    cloc
    docker
    bat
    gh
    jq
    zip
    unzip
    gnupg
    direnv
    git
    zoxide
    bat
    fastfetch
    delta
    ffmpeg

    # tui
    typioca
    binsider
    pipes-rs
    gpg-tui
    tmux
    lazygit
    btop
    neovim
    yazi
    zellij

    # gui
    jetbrains.idea
    jetbrains.rider
    jetbrains.datagrip
    jetbrains.rust-rover
    vscode
  ];
}
