{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            # EFI System Partition (ESP) for boot management
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            # NixOS root partition
            nixos_root = {
              size = "400G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };

            # Windows partition
            windows = {
              type = "0700";
              size = "1375G";
              content = {
                type = "filesystem";
                format = "ntfs";
              };
            };
          };
        };
      };
    };
  };
}
