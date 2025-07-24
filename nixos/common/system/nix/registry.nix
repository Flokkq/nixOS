{config, ...}: {
  nix.registry = {
    nixos = {
      to = {
        type = "path";
        path = "${config.users.users.flokkq.home}/developer/nixOS";
      };
      exact = true;
    };
  };
}
