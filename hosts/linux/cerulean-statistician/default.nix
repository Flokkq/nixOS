{ inputs, ... }:

{
  imports =[ 
    ./hardware-configuration.nix
    ./main-user.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.flokkq = {
        imports = [
            ./home.nix
            inputs.catppuccin.homeManagerModules.catppuccin
        ];
    };     
  };
}
