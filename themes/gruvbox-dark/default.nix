{pkgs, ...}: {
  name = "gruvbox-dark";
  scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  polarity = "dark";
  wallpaper = ../../wallpapers/nixos-gruvbox-dark.jpg;

  cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 24;
  };

  fonts = {
    monospace.package = pkgs.nerd-fonts.hack;
    sansSerif.package = pkgs.nerd-fonts.hack;
    serif.package = pkgs.nerd-fonts.hack;
    emoji.package = pkgs.nerd-fonts.hack;
  };
}
