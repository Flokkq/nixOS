# Services Configuration
{
  pkgs,
  meta,
  ...
}: let
  startupCmd =
    if meta.system.desktop == "wayland"
    then "Hyprland"
    else "startx";
  enable_xorg =
    meta.system.desktop == "xorg";
in {
  # For programs like gparted (that requires root permission) to work
  # <https://wiki.nixos.org/wiki/Polkit>
  security.polkit.enable = true;

  # Disable as it slows down the boot time
  systemd.services.NetworkManager-wait-online.enable = false;

  systemd.user.services = {
    # USB Automounting
    # <https://wiki.nixos.org/wiki/PCManFM#USB_Automounting>
    udisks2.enable = true;
    devmon.enable = true;

    blueman.enable = true; # GUI Bluetooth Manager

    # For thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };

  # https://wiki.nixos.org/wiki/SSH_public_key_authentication
  services.openssh = {
    enable = false;
    settings = {
      passwordAuthentication = false; # setting it to false requires public key authentication for better security
      kbdInteractiveAuthentication = false;
      PermitRootLogin = "yes";
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${startupCmd}";
        user = "greeter";
      };
    };
  };

  # To avoid system freeze
  systemd.oomd.enable = true;
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 3;
    freeSwapThreshold = 9;
  };

  services.picom.enable = enable_xorg;
  services.xserver = {
    enable = enable_xorg;
    layout = "us";
    xkbOptions = "eurosign:e";

    windowManager.bspwm = {
      enable = enable_xorg;
      package = pkgs.bspwm;
    };

    displayManager.lightdm.enable = false;
    displayManager.startx.enable = true;

    desktopManager.xterm.enable = false;
  };
  services.xrdp.defaultWindowManager = "bspwm";

  services.tailscale = {
    enable = true;

    extraSetFlags = ["--operator=flokkq"];
  };
}
