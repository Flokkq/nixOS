{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    grimblast
    slurp
    swappy
    xev
    kanata
    alsa-utils
    networkmanagerapplet
    pulseaudio

    # gui
    xdg-desktop-portal-hyprland
    xdg-desktop-portal

    xcursorthemes
    xinit
    xinput
    picom
  ];
}
