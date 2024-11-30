{meta, ...}: {
  programs.zsh = {
    shellAliases.rebuildnix = "sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --impure --flake ~/developer/nixOS/#${meta.name}";
  };
}
