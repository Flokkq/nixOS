{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.sops-nix.homeManagerModules.sops

    ../../sops.nix
    ../../home
    ../../home/linux
  ];

  # Home Manager needs a bit of information about the user and paths
  home.username = "flokkq";
  home.homeDirectory = lib.mkForce "/home/flokkq";

  home.enableNixpkgsReleaseCheck = false;
  targets.genericLinux.enable = true;

  home.activation = {
    linkDesktopApplications = {
      after = ["writeBoundary" "createXdgUserDirectories"];
      before = [];
      data = '''';
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager.
  home.stateVersion = "24.05";
}
