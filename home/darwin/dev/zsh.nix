{
  config,
  pkgs,
  meta,
  ...
}: {
  programs.zsh = {
    enable = true;
    # Custom initialization
    initExtra = ''
      export PATH=/opt/homebrew/bin:$PATH
      export PATH=/run/current-system/sw/bin:$PATH
      export PATH=/etc/profiles/per-user/flokkq/bin/:$PATH
    '';
  };
}
