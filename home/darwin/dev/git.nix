{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    aliases = {
      open = "!sh -c 'url=$(git config --get remote.origin.url); if [[ $url == git@* ]]; then url=$(echo $url | sed -e \"s/:/\\//\" -e \"s/^git@/https:\\/\\//\" -e \"s/\\.git$//\"); fi; open $url'";
    };
  };
}
