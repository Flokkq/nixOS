{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    grim
    xorg.xev

    # fonts
    nerdfonts

    # gui
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
  ];
}
