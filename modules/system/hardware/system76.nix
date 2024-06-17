 
{ inputs, pkgs, config, lib, ... }:
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
     "ro" "quiet" "loglevel=0" "splash" "systemd.show_status=false" "i8042.noaux"  
    ];
    blacklistedKernelModules = [ "psmouse" ];
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    #initrd.kernelModules = [  ];
    initrd.kernelModules = [ 
      "kvm-amd"
      "tls"
      "zstd"
      "binfmt_misc"
      "irqbypass"
      "bfq"
      "kyber_iosched"
      "msr"
      "parport"
      "parport_pc"
      "ppdev"
      "lp"
      "async_memcpy"
      "async_pq"
      "async_xor"
      "async_tx"
      "xor"
      "libcrc32c"
      "system76-acpi" 
      "system76-io"
    ];
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
      power-daemon.enable = false;
    };
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  services.xserver.synaptics.enable = false;
  services.libinput.enable = true;
}
