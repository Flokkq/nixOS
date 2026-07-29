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
    xcursorthemes
    xinit
    xinput
    picom
  ];
}
