{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
  ];

  home.file.".config/lazygit/config.yml".text = ''
    git:
      extraCommitArgs: "--signoff"
  '';
}
