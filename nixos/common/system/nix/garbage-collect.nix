# Nix Garbage Collection Configuration
#- https://wiki.nixos.org/wiki/Storage_optimization
_: {
  # <https://wiki.nixos.org/wiki/Storage_optimization#Automation>
  nix = {
    gc = {
      automatic = true;
      # interval.Weekday = 7;
      options = "--delete-older-than 7d";
    };

    # <https://wiki.nixos.org/wiki/Storage_optimization#Optimising_the_store>
  };

  nix.optimise.automatic = true;
}
