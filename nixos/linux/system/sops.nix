{inputs, ...}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets.nix;
    defaultSopsFormat = "nix";
    age = {
      sshKeyPaths = ["/home/flokkq/.ssh/id_ed25519"];
      keyFile = "/home/flokkq/.config/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
