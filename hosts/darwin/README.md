# nix-darwin :rocket:

If you’re looking to get started with nix-darwin, [@ryan4yin](https://github.com/ryan4yin) has an excellent kickstart repository! Check it out [here](https://github.com/ryan4yin/nix-darwin-kickstarter.git). Additionally, the official [nix-darwin repository](https://github.com/LnL7/nix-darwin.git) provides a comprehensive guide, especially useful for your first iteration and switch.

## Where Are All the Binaries?

Whether you’re transitioning from NixOS or starting fresh, you might wonder where nix-darwin places the binaries.

### System Packages

Packages installed directly from nixpkgs like this:

```nix
environment.systemPackages = [
  pkgs.nerdfonts
];
```

are located at `/run/current-system/sw/bin`.

### Home-Manager Packages

Packages installed via home-manager:

```nix
home.packages = with pkgs; [
  discord
];
```

are located at `/etc/profiles/per-user/<your-username>/bin`.

## Changing System Settings

You can safely customize almost every setting on your macOS with nix-darwin. For more details, take a look at [My System Settings Configuration](./system.nix).

## Nix Has Few (Desktop) Packages for ARM/MacOS

No worries! nix-darwin integrates seamlessly with Homebrew, allowing you to install any Brew or App Store application you need. For more information on how to do this, see [this](./apps.nix).
