{
  inputs,
  lib,
  ...
}: let
  defaultModules = import ./default.nix {inherit inputs lib;};
  linuxModules = import ./linux {inherit inputs lib;};
in {
  imports = builtins.concatLists [
    [inputs.catppuccin.homeManagerModules.catppuccin]
    (
      if builtins.isList defaultModules
      then defaultModules
      else [defaultModules]
    )
    (
      if builtins.isList linuxModules
      then linuxModules
      else [linuxModules]
    )
  ];

  home.username = "root";
  home.homeDirectory = lib.mkForce "/home/root";
  home.enableNixpkgsReleaseCheck = false;
  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
