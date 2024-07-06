{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.home-manager
      ];
    };

    templates = {
      rust-default = {
        description = "Default Rust template";
        path = ./templates/rust/default;
      };

      /* rust-axum = {
        description = "Rust template with Axum framework";
        path = ./templates/rust/axum;
      }; */

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
