# Programs Configuration
{
  pkgs,
  inputs,
  meta,
  ...
}: {
  programs = {
    partition-manager.enable = true;

    # Conflicts `programs.command-not-found.enable` | `programs.nix-index`. Only one among those.
    command-not-found.enable = false; # Doesn't work without channels
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    virt-manager.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    hyprland = {
      enable = meta.system.desktop == "wayland";
      package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
