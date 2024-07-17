{ config, lib, pkgs, inputs, ... }:
let 
  cfg = config.hardware;
in  
{
  imports = [
     inputs.nixos-hardware.nixosModules.common-cpu-amd
     inputs.nixos-hardware.nixosModules.common-pc-ssd
     inputs.chaotic.nixosModules.default
  ];

  options = {
    hardware.msi = {
      enable = lib.mkEnableOption "MSI hardware";
    };
    hardware.system76 = {
      enable = lib.mkEnableOption "System76 hardware";
    };
  };

  ### Sound
  # Make pipewire realtime capable
  security.rtkit.enable = true;

  # Can't have pulse and pipewire 
  hardware.pulseaudio.enable = lib.mkForce false;

  ### Printing
  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.hplip
        pkgs.hplipWithPlugin
      ];
    };
  };

  ### Firmware
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;  
    enableAllFirmware = true;
  };  

  ### Kernel and scheduler
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  #chaotic.scx.enable = true;
  #chaotic.scx.scheduler = "scx_rusty";

  ### MSI motherboard system
  config = lib.mkMerge [
    (lib.mkIf cfg.msi.enable {
      imports = [
        inputs.lanzaboote.nixosModules.lanzaboote
      ];

       ### Logitech keyboard and mouse      
       hardware = {
         logitech.wireless.enable = true;
         logitech.wireless.enableGraphical = true;
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
     
         # For secureboot
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
    })

    ### System76 laptop (Pangolin 12)
   (lib.mkIf cfg.system76.enable {
      imports = [
        inputs.nixos-hardware.nixosModules.system76
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
      };
    
      # Touchpad support
      services.xserver.synaptics.enable = false;
      services.libinput.enable = true;
    })    
  ];
}
