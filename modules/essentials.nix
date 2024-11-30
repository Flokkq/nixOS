{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # fonts
    nerdfonts
  ];
}
