{meta, ...}: {
  imports = [
    ./${meta.system.desktop}
    ./dev
    ./apps

    ./nautilus.nix
    ./gtk.nix
  ];
}
