{
  inputs,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ./kernel.nix
  ];

  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
    enableAllFirmware = true;
  };

  boot = {
    # Disable systemd-boot for lanzaboote
    loader.systemd-boot.enable = lib.mkForce false;

    # Kernel
    kernelParams = [
      "quiet"
      "loglevel=0"
      "splash"
      "systemd.show_status=false"
      "iommu=pt"
      "psi=1"
    ];

    kernelModules = [
      "kvm-amd"
    ];

    extraModulePackages = [

    ];

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;  
}
