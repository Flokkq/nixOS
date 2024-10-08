### **Linux Installation Steps:**

1. **Copy the Disko Config Over:**

   Use `scp` to copy the Disko configuration file to the target NixOS machine:

   ```bash
   scp disko-config.nix nixos@nixos:/tmp/disko-config.nix
   ```

2. **Create the Secret Key File:**

   Store your password in `/tmp/secret.key`:

   ```bash
   echo 'my-password' > /tmp/secret.key
   ```

3. **Run Disko to Create the Partition Table:**

   Execute the following command to partition the disks based on the `disko-config.nix` file:

   ```bash
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix
   ```

4. **Generate the NixOS Config Without Filesystems:**

   Use `nixos-generate-config` to create the base configuration, but do not include the filesystem definitions:

   ```bash
   nixos-generate-config --no-filesystems --root /mnt
   ```

5. **Copy Configuration Files to the Target Machine:**

   Transfer both the system configuration and Disko configuration files to the correct location:

   ```bash
   scp configuration.nix root@nixos:/mnt/etc/nixos/configuration.nix
   scp disko-config.nix root@nixos:/mnt/etc/nixos/disko-config.nix
   ```

6. **Install NixOS and Reboot:**

   Finally, install NixOS and reboot the machine:

   ```bash
   nixos-install
   reboot
   ```

---

### **Darwin Installation Steps:**

For Darwin (macOS), the installation process is simpler and handled through `nix-darwin`. Detailed steps can be found in the official [nix-darwin documentation](https://github.com/LnL7/nix-darwin).
