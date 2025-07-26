{
  lib,
  pkgs,
}: let
  dir = ./.;
  names = builtins.attrNames (builtins.readDir dir);
  themes = lib.genAttrs names (n: import (dir + "/${n}") {inherit lib pkgs;});
in {
  inherit themes names;
  get = name: lib.getAttr name themes;
}
