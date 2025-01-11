{pkgs, ...}: {
  imports = [
    ./brew.nix
    ./mas.nix
  ];

  environment.systemPackages = with pkgs; [
    mkalias
    iterm2
    lua54Packages.lua
    dockutil
  ];
}
