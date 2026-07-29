_: {
  imports = [
    ./hypr
    ./swaync
    ./waybar
    # ./wofi

    ./avizo.nix
    ./grimblast.nix
    ./showmethekey.nix
    ./waypaper.nix
    ./walker.nix
  ];

  services.tailscale-systray.enable = true;
}
