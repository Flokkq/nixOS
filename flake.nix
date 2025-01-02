{
  description = "Nixos config flake for darwin and linux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    schizofox = {
      url = "github:schizofox/schizofox/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # FlakeHub
    catppuccin-vsc = {
      url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    nix-darwin,
    nixpkgs,
    home-manager,
    disko,
    impermanence,
    nix-homebrew,
    ...
  } @ inputs: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    hosts = [
      {
        name = "cerulean-statistician";
        system = "linux";
        monitors = [
          {
            name = "HDMI-A-1";
            dimensions = "1920x1080";
            position = "auto";
            scale = 1;
            framerate = 74.97;
            transform = 0;
            primary = false;
            internal = false;
          }
          {
            name = "DP-2";
            dimensions = "2560x1440";
            position = "auto";
            scale = 1;
            framerate = 143.86;
            transform = 0;
            primary = true;
            internal = false;
          }
          {
            name = "HDMI-A-2";
            dimensions = "1920x1080";
            position = "auto";
            scale = 1;
            framerate = 74.97;
            transform = 0;
            primary = false;
            internal = false;
          }
        ];
      }
      {
        name = "heliotrope-secretary";
        system = "linux";
        monitors = [
          {
            name = "LVDS-1";
            dimensions = "1920x1080";
            position = "auto";
            scale = 1;
            framerate = 60;
            transform = 0;
            primary = false;
            internal = true;
          }
        ];
      }

      {
        name = "cornflower-scientist";
        system = "darwin";
        monitors = [
          /*
          builtin: true
          */
        ];
      }
    ];

    # Function to generate configurations for all systems
    forAllSystems = fn: nixpkgs.lib.genAttrs systems (system: fn {pkgs = import nixpkgs {inherit system;};});

    # Overlays to be used only for Linux

    forLinuxHosts = host: {
      name = host.name;
      value = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
          };
        };
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          impermanence.nixosModules.impermanence

          ./hosts/linux/${host.name}/hardware-configuration.nix
          ./hosts/linux/${host.name}/disko-config.nix

          ./hosts/linux/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "bak";
            home-manager.useUserPackages = true;
            home-manager.users.flokkq = import ./hosts/linux/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              meta = host;
            };
          }
        ];
        # overlays = [ overlays ];
      };
    };

    forDarwinHosts = host: {
      name = host.name;
      value = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
          };
        };
        modules = [
          ./hosts/darwin/${host.name}/default.nix
          ./hosts/darwin/configuration.nix

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "flokkq";
              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "bak";
            home-manager.users.flokkq = import ./hosts/darwin/home.nix;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              meta = host;
            };
          }
        ];
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map forLinuxHosts (builtins.filter (h: h.system == "linux") hosts));
    darwinConfigurations = builtins.listToAttrs (map forDarwinHosts (builtins.filter (h: h.system == "darwin") hosts));

    # Use modules for both macOS and Linux
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    # Define formatter for Linux and macOS
    formatter = forAllSystems ({pkgs}: pkgs.alejandra);

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
        description = "Simple Hello World written in C";
        path = ./templates/c/default;
      };
    };
  };
}
