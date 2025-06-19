{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    grimblast
    slurp
    swappy
    xorg.xev
    kanata
    alsa-utils
    networkmanagerapplet
    pulseaudio

    # gui
    xdg-desktop-portal-hyprland
    xdg-desktop-portal

    xorg.xcursorthemes
    xorg.xinit
    xorg.xinput
    picom
  ];
}
