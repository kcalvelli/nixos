{ inputs, lib, pkgs, ... }:
{

  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
    enableAllFirmware = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Disable systemd-boot for lanzaboote
    loader.systemd-boot.enable = lib.mkForce false;
    # Kernel
    kernelParams = [
      "quiet" "loglevel=0" "splash" "systemd.show_status=false" "iommu=pt" "psi=1"   
    ];

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}