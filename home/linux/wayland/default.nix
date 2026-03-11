_: {
  imports = [
    ./hypr
    ./swaync
    ./waybar
    # ./wofi

    ./avizo.nix
    ./grimblast.nix
    ./waypaper.nix
    ./walker.nix
  ];

  services.tailscale-systray.enable = true;
}
