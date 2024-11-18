{
  config,
  pkgs,
  meta,
  ...
}: {
  programs.zsh = {
    shellAliases.rebuildnix = "NIXPKGS_ALLOW_UNFREE=1 darwin-rebuild switch --impure --flake ~/developer/nixOS/#${meta.name}";

    initExtra = ''
      export PATH=/opt/homebrew/bin:$PATH
      export PATH=/run/current-system/sw/bin:$PATH
      export PATH=/etc/profiles/per-user/flokkq/bin/:$PATH
    '';
  };
}
