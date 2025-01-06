{
  inputs,
  pkgs,
  meta,
  ...
}: let
  config_dir =
    if meta.system == "darwin"
    then "Library/Application Support/"
    else ".config/";
in {
  imports = [
    # home manager module for dooit
    inputs.dooit.homeManagerModules.default
  ];

  # adds dooit-extras to pkgs
  nixpkgs.overlays = [inputs.dooit-extras.overlay];

  programs.dooit = {
    enable = true;
    extraPackages = [pkgs.dooit-extras];
  };

  home.file."${config_dir}/dooit/config.py".source = ./config.py;
}
