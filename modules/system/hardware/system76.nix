 
{ inputs, pkgs, config, lib, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
  ];

  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
     "ro" "quiet" "loglevel=0" "splash" "systemd.show_status=false"   
    ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "system76-io" "system76-acpi" ];
    initrd.kernelModules = [ "system76-acpi" ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    #extraModprobeConfig = ''
    #options mt7921_common disable_clc=1
    #'';
  };

  # Enable all the system76 stuff
  hardware = {
    system76 = {
      enableAll = true;
      kernel-modules.enable = true;
    };
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
