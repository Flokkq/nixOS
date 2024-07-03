{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./main-user.nix

      inputs.home-manager.nixosModules.default
    ];

  main-user.enable = true;
  main-user.userName = "flokkq";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

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

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  
  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  xdg.portal.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.flokkq = {
    isNormalUser = true;
    description = "flokkq";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      git
      eza
      zoxide
      tmux
      neovim 
      oh-my-zsh
      fzf
      ripgrep
      btop
      cloc
      docker
      bat
      xclip
      xorg.xev
      gh
      yad
      xdg-desktop-portal
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users = {
      "flokkq" = import ./home.nix;
    };
  };

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    pkgs.nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    pkgs.nerdfonts
    pkgs.xdg-desktop-portal-hyprland


    # (pkgs.stdenv.mkDerivation {
    #    name = "monaco";
    #    src = ./fonts/monaco.ttf;
    #    fontDirectories = [ "share/fonts/truetype" ];
    # })
  ];

  environment.sessionVariables = {
    # Session variables can be added here if needed
  };

  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  system.stateVersion = "23.11"; 
}
