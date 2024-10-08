{ lib, ... }:

{
  generateHyprlandMonitorConfig = monitors: lib.concatStringsSep "\n" (map (monitor:
    builtins.concatStringsSep "," [
      monitor.name
      "${
        if monitor ? dimensions
        then monitor.dimensions
        else "${monitor.width}x${monitor.height}"
      }@${builtins.toString monitor.framerate}"
      monitor.position
      (builtins.toString monitor.scale)
      "transform"
      (builtins.toString monitor.transform)
    ]
  ) monitors);
}
