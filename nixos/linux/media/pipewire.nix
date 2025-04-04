# PipeWire Configuration
#- <https://wiki.nixos.org/wiki/PipeWire>
_:
#let nix-gaming = import (builtins.fetchTarball "https://github.com/fufexan/nix-gaming/archive/master.tar.gz"); in
{
  # imports = [
  #   "${nix-gaming}/modules/pipewireLowLatency.nix"
  # ];

  hardware.pulseaudio.enable = false;

  # make pipewire realtime-capable
  security.rtkit.enable = true;

  # pipewire low latency
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    alsa = {
      enable = true;
      support32Bit = false;
    };

    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 32;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 32;
      };
    };
  };
}
