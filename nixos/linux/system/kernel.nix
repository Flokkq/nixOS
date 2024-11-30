# Kernel Configuration
#- <https://wiki.nixos.org/wiki/Linux_kernel>
# Kernel Configuration
{pkgs, ...}: {
  boot = {
    # Search for `linuxKernel.kernels` in nixpkgs/package search
    # kernelPackages = pkgs.linuxPackages_latest; # https://www.kernel.org
    # kernelPackages = pkgs.linuxPackages_zen; # https://github.com/zen-kernel/zen-kernel
    # kernelPackages = pkgs.linuxPackages_lqx; # https://liquorix.net
    kernelPackages = pkgs.linuxPackages_xanmod_latest; # https://xanmod.org

    # consoleLogLevel = 4;

    # The Linux kernel does not have Rust language support enabled by default.
    # Enable experimental Rust support (for kernel versions >=6.7):
    /*
       kernelPatches = [
      {
        name = "Rust Support";
        patch = null;
        features = {
          rust = true;
        };
      }
    ];
    */

    kernelParams = [
      "quiet" # Reduces boot output messages for a cleaner boot screen
      "iommu=pt" # Enables IOMMU in passthrough mode for better virtualization support
      "mitigations=off" # Disables CPU vulnerability mitigations for improved performance at the cost of security
      "nowatchdog" # Disables kernel watchdog timers, preventing potential resets due to perceived hangs
      "pcie_aspm=off" # Disables Active State Power Management (ASPM) for PCIe devices
      "logo.nologo" # Disables the display of the kernel logo during boot
      /*
      "splash" # Enables a splash screen during boot
      "split_lock_detect=off" # Disables detection of split lock operations
      "rd.udev.log_level=4" # Sets the udev log level to 4
      */
    ];

    blacklistedKernelModules = [
      "ucsi_ccg" # USB Type-C UCSI driver
      "i915" # Intel integrated graphics driver
      "amdgpu" # AMD GPU driver
      "radeon" # Older AMD Radeon GPU driver
    ];

    # Recommended by steam to improve proton performance
    kernel.sysctl."vm.max_map_count" = 1048576;
  };
}
