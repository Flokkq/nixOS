{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    sketchybar-app-font
  ];
}
