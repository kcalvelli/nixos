{ config, lib, pkgs, inputs, ... }:
let 
  cfg = config.hardware;
in  
{
  imports = [
     inputs.nixos-hardware.nixosModules.common-cpu-amd
     inputs.nixos-hardware.nixosModules.common-pc-ssd
     inputs.lanzaboote.nixosModules.lanzaboote    
     inputs.nixos-hardware.nixosModules.system76      
  ];

  options = {
    hardware.msi = {
      enable = lib.mkEnableOption "MSI hardware";
    };
    hardware.system76 = {
      enable = lib.mkEnableOption "System76 hardware";
    };
    hardware.common = {
      enable = lib.mkEnableOption "Common hardware config";
    };
  };


  config = lib.mkMerge [
    (lib.mkIf cfg.common.enable {
      # Boot config
      boot = {
        bootspec.enable = true;
    
        initrd = {
          systemd.enable = true;
          verbose = false;
        };
        # Plymouth is purty
        plymouth.enable = true;

        kernelPackages = pkgs.linuxPackages_latest;
      };
    
      # Swap config
      zramSwap = {
        enable = true;
        algorithm = "zstd";
      };  

      services.udisks2.enable = true;     


      ### Sound
      # Make pipewire realtime capable
      security.rtkit.enable = true;
    
      # Can't have pulse and pipewire 
      hardware.pulseaudio.enable = lib.mkForce false;

      services = {
      ### Pipewire
        pipewire = {
          enable  = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
          wireplumber.enable = true;
        };  
      ### Printing
        printing = {
          enable = true;
          drivers = [
            pkgs.hplip
            pkgs.hplipWithPlugin
          ];
        };
      ### Force power profiles daemon
        power-profiles-daemon = {
          enable = lib.mkForce true;
        };
      };
    
      ### Firmware
      hardware = {
        cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;  
        enableAllFirmware = true;
      };  
    })

    ### MSI motherboard system
    (lib.mkIf cfg.msi.enable {

       hardware.common.enable = true;

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
      hardware.common.enable = true;

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
        extraModprobeConfig = ''
          options mt7921_common disable_clc=1
        '';
      };
    
      # Enable all the system76 stuff
      hardware = {
        system76 = {
          enableAll = true;
          kernel-modules.enable = true;
        };
      };
    
      # Touchpad support
      services.xserver.synaptics.enable = false;
      services.libinput.enable = true;
    })    
  ];
}
