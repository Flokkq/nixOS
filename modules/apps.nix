{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    zathura
    postman
    wireshark
    google-chrome
  ];
}
