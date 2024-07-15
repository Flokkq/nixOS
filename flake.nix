{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, hyprland, hyprland-plugins, catppuccin, spicetify-nix, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/linux/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    darwinConfigurations = {
      "MacBook-Pro-von-Clemens" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/darwin/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    templates = {
      rust-default = {
        description = "Default Rust template";
        path = ./templates/rust/default;
      };

      go-default = {
        description = "Default Go template";
        path = ./templates/go/default;
      };

      go-nethttp = {
        description = "Go template with net/http package";
        path = ./templates/go/nethttp;
      };

      c-default = {
        description = "Simple Hello World in C";
        path = ./templates/c/default;
      };
    };
  };
}
