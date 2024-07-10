{ lib, config, pkgs, ... }:

let
  cfg = config.main-user;
in
{
  options = {
    main-user.enable = lib.mkEnableOption "Enable user module";

    main-user.userName = lib.mkOption {
      default = "mainuser";
      description = ''
        Username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "03012007";
      description = lib.mkDefault "Main user";
      shell = pkgs.zsh;
    };

    programs.zsh.enable = true; # Ensure this line enables the zsh program
  };
}
