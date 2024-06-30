{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
  ];

  boot = {
    # Kernel - currently 6.7+ disables 6GHz on MT7921K, but doesn't work anyway so who gives a 
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "ro"
      "quiet"
      "loglevel=0"
      "splash"
      "systemd.show_status=false"
      "i8042.noaux"
    ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
    ];
    kernelModules = [
      "kvm-amd"
      "system76-acpi"
      "system76-io"
    ];
  };

  # Enable all the system76 stuff
  hardware = {
    system76 = {
      enableAll = true;
      kernel-modules.enable = true;
      power-daemon.enable = false;
    };
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  services.xserver.synaptics.enable = false;
  services.libinput.enable = true;
}
