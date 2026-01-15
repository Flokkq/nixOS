_: {
  imports = [
    ./hypr
    ./swaync
    ./waybar
    ./wofi

    ./avizo.nix
    ./grimblast.nix
    ./waypaper.nix
  ];

  services.tailscale-systray.enable = true;
}
