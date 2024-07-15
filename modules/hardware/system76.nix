{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.chaotic.nixosModules.default
  ];

  boot = {
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

  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  chaotic.scx.enable = true;
  chaotic.scx.scheduler = "scx_rusty";
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
