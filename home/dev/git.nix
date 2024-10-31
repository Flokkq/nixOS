{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Flokkq";
    userEmail = "webcla21@htl-kaindorf.at";
  };
}
