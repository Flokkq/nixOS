# Programs Configuration
{pkgs, inputs, ...}: {
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

    hyprland.enable = true;
    hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
}
