{pkgs, ...}: {
  imports = [
    ./terminals
    ./shells

    ./direnv.nix
    ./git.nix
    # ./zellij.nix
  ];

  home.packages = with pkgs; [
    #cava
  ];
}
