{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    discord
    zathura
    postman
    google-chrome
  ];
}
