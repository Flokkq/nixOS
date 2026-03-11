{...}: {
  imports = [
    ./firewall.nix
    ./auditd.nix
    ./antivirus.nix
  ];

  security.polkit.enable = true;
}
