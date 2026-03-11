{
  pkgs,
  meta,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      obs-studio
      kitty
      ghostty
      alacritty
      _1password-gui-beta
      _1password-cli

      # rpi-imager
      wireshark
      ghidra
      burpsuite
      nautilus
      wireguard-ui
      waypaper
      swaynotificationcenter
      screenkey
      gimp
      foliate
      qpwgraph
      elephant
      polkit

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
    ]
    ++ (
      if meta.system.desktop == "wayland"
      then with pkgs; [woomer]
      else if meta.system.desktop == "xorg"
      then with pkgs; [zoomer]
      else []
    );
}
