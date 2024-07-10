{ pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./main-user.nix

      inputs.home-manager.nixosModules.default
    ];

  main-user.enable = true;
  main-user.userName = "clemensweber";

  # Bootloader.
  networking.hostName = "MBP-Pro von Clemens";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_AT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

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
            ./home.nix
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
    pkgs.xdg-desktop-portal-hyprland

  ];

  environment.sessionVariables = {
    # Session variables can be added here if needed
  };

  system.stateVersion = "23.11"; # Don't change
}
