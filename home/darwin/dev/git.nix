{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    aliases = {
      open = "!sh -c 'open $(git config --get remote.origin.url | sed -e s/.git$//)'";
    };
  };
}
