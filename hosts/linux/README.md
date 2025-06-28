# NixOS :snowflake: :rocket:

If you’re diving into NixOS and want to use my configuration, make sure to follow the steps outlined in [INSTALL.md](../../INSTALL.md).

## System config

Each host chooses which [system configurations](../../nixos/linux) it wants to apply. Differences would be [hardware specific settings](../../nixos/linux/hardware/gpu) (e.g. gpu-drivers, ethernet, ...), virtualisation methods (docker v. podman) and just system level settings in general.

## Home-Manager

Each host imports a shared set of `home-manager` modules: [Linux-specific](../../home/linux/default.nix) and [common](../../home/default.nix), both of which are used across Linux and macOS configurations. This ensures consistency and reusability, while allowing platform-specific customizations where necessary.
