{meta, ...}: {
  programs.zsh = {
    shellAliases.rebuildnix = "NIXPKGS_ALLOW_UNFREE=1 sudo darwin-rebuild switch --impure --flake ~/developer/nixOS/#${meta.name}";

    initContent = ''
      export PATH=/opt/homebrew/bin:$PATH
      export PATH=/run/current-system/sw/bin:$PATH
      export PATH=/etc/profiles/per-user/flokkq/bin/:$PATH
    '';
  };
}
