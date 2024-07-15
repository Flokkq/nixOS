{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  # Bootloader.
  networking.hostName = "MacBook-Pro-von-Clemens";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clemensweber = {
    description = "clemensweber";
    home = lib.mkForce "/Users/clemensweber"; 
    packages = with pkgs; [
      eza
      oh-my-zsh
      fzf
      ripgrep
      cloc
      docker
      bat
      gh
      neofetch
      jq
      typioca
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.clemensweber = import ./home.nix;
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
}
