{...}: {
  imports = [
    ./dev
    ./apps
  ];

  nixpkgs.config.allowUnfree = true;
}
