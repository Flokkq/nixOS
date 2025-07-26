{pkgs, ...}: {
  name = "catppuccin-mocha";
  scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  polarity = "dark";
  wallpaper = ../../wallpapers/nixos.png;

  cursor = {
    package = pkgs.catppuccin-cursors.mochaLavender;
    name = "Catppuccin-Mocha-Lavender-Cursors";
    size = 24;
  };

  fonts = {
    monospace = {
      package = pkgs.nerd-fonts.hack;
    };
    sansSerif = {
      package = pkgs.nerd-fonts.hack;
    };
    serif = {
      package = pkgs.nerd-fonts.hack;
    };
    emoji = {
      package = pkgs.nerd-fonts.hack;
    };
  };
}
