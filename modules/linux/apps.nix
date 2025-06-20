{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    obs-studio
    kitty
    ghostty
    alacritty
    _1password-gui
    rpi-imager
    wireshark
    ghidra
    burpsuite
    nautilus
    wireguard-ui
    waypaper
    swaynotificationcenter
    gimp

    # waybar
    waybar
    grim
    pavucontrol
    wlogout
    xsensors
    playerctl

    # hypr
    swww
    libnotify
    wofi
    hypridle
    hyprlock
    hyprpaper
    hyprutils
    hyprcursor
  ];
}
