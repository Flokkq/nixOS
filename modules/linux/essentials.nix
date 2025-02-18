{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    grimblast
    swappy
    xorg.xev
    kanata
    alsa-utils

    # gui
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
  ];
}
