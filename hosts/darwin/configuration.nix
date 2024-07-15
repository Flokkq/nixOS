{ pkgs, nixpkgs, inputs, ... }:

let
  lib = nixpkgs.lib;
in
{
  imports = [
    ../main-user.nix
    inputs.home-manager.nixosModules.default
  ];

  main-user.enable = true;
  main-user.userName = "clemensweber";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Bootloader.
  networking.hostName = "MBP-Pro von Clemens";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Enable docker
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clemensweber = {
    isNormalUser = true;
    description = "clemensweber";
    packages = with pkgs; [
      eza
      oh-my-zsh
      fzf
      ripgrep
      cloc
      docker
      bat
      gh
      yad
      hayabusa
      neofetch
      jq
      typioca
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.flokkq = {
      imports = [
        # Uncomment the following line if the file exists
        # ./home.nix
      ];
    };     
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = [
    pkgs.nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = [
    pkgs.nerdfonts
  ];

  system.stateVersion = "23.11"; # Don't change
}
