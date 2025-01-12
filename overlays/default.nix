# This file defines overlays
{
  inputs,
  system,
  ...
}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # System-specific packages from `pkgs/nixos/default.nix` or `pkgs/darwin/default.nix`
  systemAdditions = final: _prev:
    import
    ../pkgs/${
      if system == "x86_64-linux" || system == "aarch64-linux"
      then "nixos"
      else "darwin"
    }/default.nix {
      pkgs = final.pkgs;
    };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = _final: _prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
