{ config, lib, pkgs, inputs, ... }:
let 
  cfg = config.hardware;
in  
{
  imports = [
    ./common.nix
     inputs.nixos-hardware.nixosModules.common-cpu-amd
     inputs.nixos-hardware.nixosModules.common-pc-ssd  
     inputs.nixos-hardware.nixosModules.system76      
  ];

  options = {
    hardware.system76 = {
      enable = lib.mkEnableOption "System76 hardware";
    };
  };

  config = lib.mkMerge [
    ### System76 laptop (Pangolin 12)
   (lib.mkIf cfg.system76.enable {      

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
        ];
        extraModprobeConfig = ''
          options mt7921_common disable_clc=1
        '';
      };
    
      # Enable all the system76 stuff
      hardware = {
        system76 = {
          enableAll = true;
        };
      };
    
      # Touchpad support
      services.xserver.synaptics.enable = false;
      services.libinput.enable = true;
    })    
  ];
}
