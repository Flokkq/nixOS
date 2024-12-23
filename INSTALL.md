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

4. **Run Disko to Create the Partition Table**

   Use Disko to set up the partitions as specified in `disko-config.nix`:

   ```bash
   sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko-config.nix
   ```

5. **Generate NixOS Configuration Without Filesystems**

   Create a base NixOS configuration without filesystem definitions:

   ```bash
   sudo nixos-generate-config --no-filesystems --root /mnt
   ```

6. **Move Configuration Files to the Target Directory**

   Transfer system and Disko configuration files to the appropriate directory:

   ```bash
   sudo mv /tmp/disk-config.nix /mnt/etc/nixos
   ```

7. **Copy base configuration file**

   Transfer the base configuration file to the target NixOS machine using `scp`:

   The config just imports the generated hardware-configuration and disko.

    ```nix
    _: {
      imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
        "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
        ./disko-config.nix
      ];

      boot.loader.systemdboot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    }
     ```

   ```bash
   scp hosts/linux/base-configuration.nix nixos@nixos:/tmp/configuration.nix
   sudo mv /tmp/configuration.nix /mnt/etc/nixos/configuration.nix
   ```

8. **Install NixOS and Reboot**

   Proceed with the NixOS installation and reboot:

   ```bash
   sudo nixos-install
   reboot
   ```

> [!IMPORTANT]
> You will be asked to set a password for the root user. Make sure to remember it, as you will need it later. 
---

### **Using This Flake for Configuration**

0. **Login after Boot**

   After rebooting, log in with the following credentials:

   - **Username**: `root`
   - **Password**: `<flokkq-is-cool>` 

1. **Install Git**

   Temporarily install Git through Nix:

   ```bash
   nix-shell -p git
   ```

2. **Clone the Configuration Repository**

   Clone the configuration repository to your home directory:

   ```bash
   cd /etc/nixos && git clone https://github.com/Flokkq/nixos.git
   ```

   Generate yourself a nice Username

   ```bash
   chmod +x hostname.sh && ./hostname.sh
   ```

   Make sure to move `hardware-configuration.nix` and `disko-config.nix` to `hosts/linux/<your_username>`

3. **Add an Entry to the Hosts Array in `flake.nix`**

   Open `flake.nix` and add a new entry to the `hosts` array using the existing template as a guide:

   ```nix
   hosts = [
     {
       name = "template";
       monitors = [];
       system = "linux";
     }
   ];
   ```

   Leave `monitors` empty initially. Define values for `name`, `system` (choose `"darwin"` or `"linux"`)

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

After following these steps make sure to add your machine to the configuration.

Open `flake.nix` and add a new entry to the `hosts` array using the existing template as a guide:

```nix
   hosts = [
     {
       name = "template";
       monitors = [];
       system = "linux";
     }
   ];
```

Leave `monitors` empty. Define values for `name`, `system` (choose `"darwin"` or `"linux"`)
