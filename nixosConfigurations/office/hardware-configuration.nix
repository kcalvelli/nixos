# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4d20a0de-1423-40df-8531-ce2c4c8da1c6";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-a35eb809-54ec-4e65-94e4-768337121e89".device = "/dev/disk/by-uuid/a35eb809-54ec-4e65-94e4-768337121e89";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/078E-BB63";
      fsType = "vfat";
    };

  fileSystems."/mnt/media/Pictures" =
    { device = "/dev/disk/by-uuid/0806889f-a4b5-4f10-99e9-777cffb4c807";
      fsType = "ext4";
    };

  fileSystems."/mnt/VM" =
    { device = "/dev/disk/by-uuid/ed69a535-afc7-45d5-be77-dc1b06282f06";
      fsType = "ext4";
    };

  #fileSystems."/home/keith/Games" =
  #  { device = "/dev/disk/by-uuid/d0fe2c38-85eb-4dff-84ca-411de9171e80";
  #    fsType = "ext4";
  #  };

  swapDevices = [  {
    device = "/swapfile";
    size = 8196;
  }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp39s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp41s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
