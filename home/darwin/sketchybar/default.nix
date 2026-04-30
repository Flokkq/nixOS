{pkgs, ...}: let
  binaries = import ./c-binaries.nix {inherit pkgs;};
  lua = pkgs.lua5_5.withPackages (_: [pkgs.sbarlua]);
in {
  home.file.".config/sketchybar" = {
    source = ./sketchybar;
    recursive = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };

  home.file.".config/sketchybar/sketchybarrc" = {
    text = ''
      #!${lua}/bin/lua
      package.path = "./?.lua;./?/init.lua;" .. package.path
      -- Load the sketchybar-package and prepare the helper binaries
      require("helpers")
      require("init")
    '';
    executable = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };

  home.file.".config/sketchybar/helpers/event_providers/cpu_load/bin/cpu_load".source = "${binaries.cpuLoadBinary}/bin/cpu_load";

  home.file.".config/sketchybar/helpers/event_providers/network_load/bin/network_load".source = "${binaries.networkLoadBinary}/bin/network_load";

  home.file.".config/sketchybar/helpers/menus/bin/menus".source = "${binaries.menusBinary}/bin/menus";
}
