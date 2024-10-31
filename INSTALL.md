### **NixOS Installation Steps**

1. **Set a Password for the NixOS User**

   To enable `scp` and other remote utilities, set a password for the NixOS user:

   ```bash
   passwd
   ```

2. **Identify Disk Name and Update Configuration**

   Use `lsblk` to identify your disk's name:

   ```bash
   lsblk
   ```

   Example output:

   ```
   NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
   nvme0n1     259:0    0   1,8T  0 disk
   ```

   Note your disk name at `/dev/<NAME>`.

3. **Copy the Disko Configuration File**

   Transfer the Disko configuration file to the target NixOS machine using `scp`:

   ```bash
   scp disko-config.nix nixos@nixos:/tmp/disko-config.nix
   ```

4. **Create the Secret Key File**

   Save your password to `/tmp/secret.key`:

   ```bash
   echo 'my-password' > /tmp/secret.key
   ```

5. **Run Disko to Create the Partition Table**

   Use Disko to set up the partitions as specified in `disko-config.nix`:

   ```bash
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix
   ```

6. **Generate NixOS Configuration Without Filesystems**

   Create a base NixOS configuration without filesystem definitions:

   ```bash
   nixos-generate-config --no-filesystems --root /mnt
   ```

7. **Move Configuration Files to the Target Directory**

   Transfer system and Disko configuration files to the appropriate directory:

   ```bash
   mv /tmp/disk-config.nix /mnt/etc/nixos
   ```

8. **Import Disko Configuration**

   When editing `configuration.nix`, add the Disko NixOS module and `disk-config.nix` to the imports section.

   Open the file with:

   ```bash
   sudoedit /mnt/etc/nixos/configuration.nix
   ```

   Add the following import lines:

   ```nix
   imports =
   [ # Include the results of the hardware scan.
     ./hardware-configuration.nix
     "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
     ./disk-config.nix
   ];
   ```

9. **Install NixOS and Reboot**

   Proceed with the NixOS installation and reboot:

   ```bash
   nixos-install
   reboot
   ```

   > **IMPORTANT**: You will be asked to set a password for the root user. Make sure to set it to `ciscodisco`, as you will need it later.

---

### **Using This Flake for Configuration**

0. **Login after Boot**

   After rebooting, log in with the following credentials:

   - **Username**: `root`
   - **Password**: `ciscodisco` (or the password you set in Step 9)

1. **Install Git**

   Temporarily install Git through Nix:

   ```bash
   nix-shell -p git
   ```

2. **Clone the Configuration Repository**

   Clone the configuration repository to your home directory:

   ```bash
   cd ~ && git clone https://github.com/Sbim-BeSt-Kaindorf/laptops.git
   ```

3. **Add an Entry to the Hosts Array in `flake.nix`**

   Open `flake.nix` and add a new entry to the `hosts` array using the existing template as a guide:

   ```nix
   hosts = [
     {
       name = "template";
       monitors = [];
       cursor = 64;
     }
   ];
   ```

   Leave `monitors` empty initially. Define values for `name`, `mode` (choose `"simple"` or `"advanced"`), `wallpaper`, and `cursor` (64 is recommended).

4. **Rebuild the System**

   Rebuild the system with the following command (this may take some time):

   ```bash
   sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --impure --flake /etc/nixos/#<hostname>
   ```

   Replace `<hostname>` with the name specified in `flake.nix`.

5. **Configure Monitors**

   After rebuilding, configure monitor settings:

   - Use `hyprctl monitors all` to view connected monitors and their details.
   - Update the `monitors` array in `flake.nix` with the correct configuration, setting `primary` and `internal` to `true` for your main display.

6. **Rebuild NixOS Configuration for Updated Monitor Settings**

   Run the rebuild command to apply monitor configurations:

   ```bash
   rebuildnix
   ```

--- 

### **Darwin Installation Steps:**

For Darwin (macOS), the installation process is simpler and handled through `nix-darwin`. Detailed steps can be found in the official [nix-darwin documentation](https://github.com/LnL7/nix-darwin).
