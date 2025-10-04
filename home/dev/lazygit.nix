{
  lib,
  pkgs,
  ...
}: {
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        commit.signOff = true;
        overrideGpg = true;
      };
    };
  };

  # lazygit changed the location of its config file.
  # Until nix-darwin supports the new location, we hardlink it here.
  home.file = lib.mkIf pkgs.stdenv.isDarwin {
    ".config/lazygit/config.yml".text = ''
      git:
        commit:
          signOff: true
        overrideGpg: true
    '';
  };
}
