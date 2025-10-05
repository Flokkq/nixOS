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

    textfox.url = "github:adriankarlen/textfox";

    schizofox = {
      url = "github:schizofox/schizofox/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dooit.url = "github:dooit-org/dooit";
    dooit-extras.url = "github:dooit-org/dooit-extras";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    nix-darwin,
    nixpkgs,
    home-manager,
    disko,
    impermanence,
    nix-homebrew,
    stylix,
    ...
  } @ inputs: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    pkgsForLib = import inputs.nixpkgs {
      # cpu does not matter here since we only use it to build the lib
      system = "x86_64-linux";
    };

    lib = import ./lib {
      inputs = inputs;
      pkgs = pkgsForLib;
    };

    hosts = [
      {
        name = "cerulean-statistician";
        system = {
          os = "linux";
          desktop = "wayland";
        };
        theme = lib.getTheme "catppuccin-mocha";
        monitors = [
          {
            name = "HDMI-A-2";
            dimensions = "1920x1080";
            position = "0x0";
            scale = 1;
            framerate = 74.97;
            transform = 0;
            primary = false;
            internal = false;
          }
          {
            name = "DP-1";
            dimensions = "2560x1440";
            position = "1920x0";
            scale = 1;
            framerate = 143.86;
            transform = 0;
            primary = true;
            internal = false;
          }
          {
            name = "HDMI-A-1";
            dimensions = "1920x1080";
            position = "4480x0";
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
        theme = lib.getTheme "catppuccin-mocha";
        system = {
          os = "linux";
          desktop = "wayland";
        };
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
        system = {
          os = "darwin";
          desktop = "bsp";
        };
        theme = lib.getTheme "catppuccin-mocha";
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
          inherit inputs lib;
          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
            theme = host.theme;
          };
        };
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          impermanence.nixosModules.impermanence
          stylix.nixosModules.stylix

          ./hosts/linux/${host.name}/hardware-configuration.nix
          ./hosts/linux/${host.name}/disko-config.nix

          ./hosts/linux/base-configuration.nix
          ./hosts/linux/${host.name}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "bak";
            home-manager.useUserPackages = true;
            home-manager.users.flokkq = import ./hosts/linux/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixlib = lib;
              meta = host;
            };
          }
        ];
        # overlays = [
        #   (import ./overlays {
        #     inherit inputs;
        #     system = host.system.os;
        #   })
        # ];
      };
    };

    forDarwinHosts = host: {
      name = host.name;
      value = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs lib;
          meta = {
            hostname = host.name;
            system = host.system;
            monitors = host.monitors;
            theme = host.theme;
          };
        };
        modules = [
          stylix.darwinModules.stylix
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
              nixlib = lib;
              meta = host;
            };
          }
        ];
        # overlays = [
        #   (import ./overlays {
        #     inherit inputs;
        #     system = host.system.os;
        #   })
        # ];
      };
    };
  in rec {
    nixosConfigurations = builtins.listToAttrs (map forLinuxHosts (builtins.filter (h: h.system.os == "linux") hosts));
    darwinConfigurations = builtins.listToAttrs (map forDarwinHosts (builtins.filter (h: h.system.os == "darwin") hosts));

    # Use modules for both macOS and Linux
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    # Define formatter for Linux and macOS
    formatter = forAllSystems ({pkgs}: pkgs.alejandra);

    templates = import ./templates {inherit lib;};

    # Used to mirror the system to a remote repo in CI
    mirror = import ./lib/mirror.nix {
      inherit hosts nixosConfigurations darwinConfigurations;
    };
  };
}
