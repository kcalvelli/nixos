{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.hardware;
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ./common.nix
  ];

  options = {
    hardware.msi = {
      enable = lib.mkEnableOption "MSI hardware";
    };
  };

  config = lib.mkMerge [

    ### MSI motherboard system
    (lib.mkIf cfg.msi.enable {

      hardware = {
        ### Logitech keyboard and mouse
        logitech.wireless.enable = true;
        logitech.wireless.enableGraphical = true;

        amdgpu.initrd.enable = true;
      };

      boot = {
        kernelParams = [
          "quiet"
          "loglevel=0"
          "splash"
          "systemd.show_status=false"
          "iommu=pt"
          "psi=1"
          "amd_iommu=force_isolation"
          "nohz_full=1-8"
          "rcu_nocbs=1-8"
        ];

        kernelModules = [ "kvm-amd" ];

        extraModulePackages = [

        ];

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
      services.power-profiles-daemon.enable = lib.mkForce false;
    })
  ];
}
