# Bluetooth Configuration
#- <https://wiki.nixos.org/wiki/Bluetooth>
{pkgs, ...}: {
  services.blueman.enable = true;
  environment.systemPackages = with pkgs; [blueman bluez bluez-tools];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    hsphfpd.enable = false;
    package = pkgs.bluez;

    settings.Policy.AutoEnable = "true";
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Name = "Hello";
      ControllerMode = "dual";
      FastConnectable = "true";
      Experimental = "true";
      KernelExperimental = "true";
    };
  };
}
