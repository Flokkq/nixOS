{pkgs, ...}: let
  sketchybarLua = import ./sbar-lua.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    sketchybarLua
  ];

  imports = [
    ./c-binaries.nix
  ];

  home.file.".config/sketchybar" = {
    source = ./sketchybar;
    recursive = true;
  };

  #  home.file.".config/sketchybar/wrapper.sh".text = ''
  #    #!/usr/bin/env bash
  #
  #    export SB_LUA_PATH="${sketchybarLua}/share/lua/5.4";
  #  '';
  #
  # home.sessionVariables = {
  #    SB_LUA_PATH = "${sketchybarLua}/share/lua/5.4";
  #  };
}
