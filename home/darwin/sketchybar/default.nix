{pkgs, ...}: let
  binaries = import ./c-binaries.nix {inherit pkgs;};
in {
  home.file.".config/sketchybar" = {
    source = ./sketchybar;
    recursive = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };

  home.file.".local/share/sketchybar_lua/sketchybar.so" = {
    source = "${pkgs.sbar-lua}/lib/sketchybar.so";
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };

  home.file.".config/sketchybar/sketchybarrc" = {
    text = ''
      #!/usr/bin/env ${pkgs.lua54Packages.lua}/bin/lua
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
