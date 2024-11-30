{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    _1password-gui
    rpi-imager
    wireshark
    ghidra
    burpsuite
    nautilus

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
  ];
}