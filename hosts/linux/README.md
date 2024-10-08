# NixOS :snowflake: :rocket:

If you’re diving into NixOS and want to use my configuration, make sure to follow the steps outlined in [INSTALL.md](../../INSTALL.md).

## Overlays

Custom overlays, including things like [my custom curser](../../pkgs/banana-cursor-dreams/default.nix), are located in the [overlays/](../../overlays/) directory. These are automatically configured across all hosts in the configuration.

## Monitors and Display Setup

Monitor configurations for individual devices are set in the host-specific section of the `flake.nix` file. These settings are applied across various components:

- [Hyprland window manager](../../home/linux/hypr/default.nix)
- [Hyprlock lock screen](../../home/linux/hypr/hyprlock.nix)
- [Hyprpaper wallpaper manager](../../home/linux/hypr/hyprpaper.nix)
  
An example configuration might look like this:

```nix
{
  name = "cerulean-statistician"; 
  system = "linux";
  monitors = [ # `hyprctl monitors all` for monitor information
    {
      name = "DP-2";
      dimensions = "2560x1440";
      position = "auto";
      scale = 1;
      framerate = 143.86;
      transform = 0;
      primary = true;  
    }
  ];
}
```

## Home-Manager

Each host imports a shared set of `home-manager` modules: [Linux-specific](../../home/linux/default.nix) and [common](../../home/default.nix), both of which are used across Linux and macOS configurations. This ensures consistency and reusability, while allowing platform-specific customizations where necessary.
