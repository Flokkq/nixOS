{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    eza
    oh-my-zsh
    fzf
    ripgrep
    cloc
    docker
    bat
    gh
    jq
    zip
    unzip
    distrobox
    yad

    # tui
    typioca
    binsider
  ];
}
