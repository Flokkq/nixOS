{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    distrobox
    yad
    gdb
    gf
  ];
}
