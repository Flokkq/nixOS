#../github/workflows/mirror.yml
{
  hosts,
  nixosConfigurations,
  darwinConfigurations,
}: let
  mkRunner = os:
    if os == "darwin"
    then "macos-latest"
    else "ubuntu-latest";

  systemOut = builtins.listToAttrs (map (h: {
      name = h.name;
      value =
        if h.system.os == "darwin"
        then darwinConfigurations.${h.name}.system
        else nixosConfigurations.${h.name}.config.system.build.toplevel;
    })
    hosts);

  hmActivation = builtins.listToAttrs (map (h: {
      name = h.name;
      value = let
        cfg =
          if h.system.os == "darwin"
          then darwinConfigurations.${h.name}.config
          else nixosConfigurations.${h.name}.config;

        hmPkg = user: (cfg.home-manager.users.${user}.home.activationPackage
              or cfg.home-manager.users.${user}.activationPackage);
      in {
        flokkq = hmPkg "flokkq";
      };
    })
    hosts);
in {
  hosts =
    map (h: {
      name = h.name;
      os = h.system.os;
      runner = mkRunner h.system.os;
    })
    hosts;

  inherit systemOut hmActivation;
}
