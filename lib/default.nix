{
  inputs,
  pkgs,
}: let
  lib = inputs.nixpkgs.lib;
  tlib = import ../themes/default.nix {inherit lib pkgs;};
in
  lib
  // rec {
    filesInDirectoryWithSuffix = directory: suffix:
      lib.pipe (lib.filesystem.listFilesRecursive directory) [
        builtins.filter
        (name: lib.hasSuffix suffix name)
      ];

    getTheme = name: let
      themeName =
        if name != null
        then name
        else lib.warn "meta.theme not set" (builtins.head tlib.names);
    in
      tlib.get themeName;

    headDefault = default: list:
      if list == []
      then default
      else builtins.head list;

    toHyprlandString = monitor:
      lib.concatStringsSep "," [
        monitor.name
        (
          if monitor ? dimensions
          then "${monitor.dimensions}@${toString monitor.framerate}"
          else "${monitor.width}x${monitor.height}@${toString monitor.framerate}"
        )
        monitor.position
        (toString monitor.scale)
        "transform"
        (toString monitor.transform)
      ];

    generateHyprlandMonitorConfig = monitors:
      map toHyprlandString monitors;

    getPrimaryMonitor = monitors: let
      primaryMonitors = lib.filter (m: m.primary || m.internal) monitors;
    in
      if primaryMonitors != []
      then (lib.head primaryMonitors).name
      else null;

    getSecondaryMonitors = monitors:
      lib.filter (m: !(m.primary || m.internal)) monitors;

    getPrimaryMonitorObj = monitors: let
      primaryMonitors = lib.filter (m: m.primary || m.internal) monitors;
    in
      headDefault null primaryMonitors;

    generateMirrorConfig = _primaryMonitor: secondaryMonitors:
      lib.concatStringsSep " " (lib.map (
          mon:
            lib.concatStringsSep "," [
              mon.name
              mon.dimensions
              "0x0" # Position for mirroring
              (toString mon.scale)
              (toString mon.transform)
            ]
        )
        secondaryMonitors);

    generateExtendConfig = primaryMonitorObj: secondaryMonitors: let
      primaryWidth = headDefault "0" (lib.splitString "x" primaryMonitorObj.dimensions);
    in
      lib.concatStringsSep " " (lib.genList (
        i: let
          mon = secondaryMonitors [i];
          posX = toString (lib.parseInt primaryWidth 10 * (i + 1)); # Adjusted calculation
        in
          lib.concatStringsSep "," [
            mon.name
            mon.dimensions
            "${posX}x0" # Position for extending
            (toString mon.scale)
            (toString mon.transform)
          ]
      ) (lib.length secondaryMonitors));

    homeDir = inputs.config.users.users.flokkq.home;
    nixosConfigDir = "${homeDir}/developer/nixOS";
  }
