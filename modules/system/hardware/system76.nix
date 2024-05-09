 
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
  ];

  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
     "ro" "quiet" "loglevel=0" "splash" "systemd.show_status=false"   
    ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "system76-io" ];
    initrd.kernelModules = [  ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
    options mt7921_common disable_clc=1
    '';
  };

  # Enable all the system76 stuff
  hardware = {
    system76.enableAll = true;
    enableAllFirmware = true;
  };
}
