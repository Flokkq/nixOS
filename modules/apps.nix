{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    discord
    zathura
    postman
    wireshark
    google-chrome
  ];
}
