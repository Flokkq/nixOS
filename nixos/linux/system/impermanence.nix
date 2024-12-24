{environment.persistence."/persistent" = {
  enable = true;
  hideMounts = true;
  directories = [
    "/var/log"
    "/var/lib/bluetooth"
    "/var/lib/nixos"
    "/var/lib/systemd/coredump"
    "/etc/NetworkManager/system-connections"
    { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    "/home/flokkq/developer"  # Persist the developer directory in flokkq's home folder
  ];
  files = [
    "/etc/machine-id"
    { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
  ];
  users.flokkq = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "VirtualBox VMs"
      { directory = ".gnupg"; mode = "0700"; }
      { directory = ".ssh"; mode = "0700"; }
      { directory = ".nixops"; mode = "0700"; }
      { directory = ".local/share/keyrings"; mode = "0700"; }
      ".local/share/direnv"
      { directory = "developer"; mode = "u=rwx,g=rx,o=rx"; }  # Include the developer directory
    ];
    files = [
      ".screenrc"
    ];
  };
};
}
