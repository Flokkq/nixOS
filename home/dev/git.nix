{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Flokkq";
    userEmail = "webcla21@htl-kaindorf.at";
    aliases = {
      sync = "!git add . && git commit -m 'sync' && git push -u origin main";
    };
  };
}
