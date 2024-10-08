{ inputs, ... }:

{
  imports = [
    ./apps.nix
    ./system.nix
  ];

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.clemensweber = import ./home.nix;
  };
}
