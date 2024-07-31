{ inputs, pkgs, ... }:
let 
  cfg = config.virt;
in 
{
  options = {
    virt.containers = {
      lib.mkEnableOption "Enable Containers"
    };
  };  
  options = {
    virt.libvirt = {
      lib.mkEnableOption "Enable libvirt"
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.containers.enable {
     virtualisation = { 
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings = {
          dns_enabled = true;
        };
      };
     };
     virtualisation.waydroid.enable = true;
    })
  ];

    config = lib.mkMerge [
    (lib.mkIf cfg.libvirt.enable {
      virtualisation = {
       libvirtd = {
         enable = true;
         qemu = {
           #package  = pkgs.qemu_kvm;
           ovmf.enable = true;
           ovmf.packages = [ pkgs.OVMFFull.fd ];
           #swtpm.enable = true;runAsRoot = false;
           swtpm.enable = true;
           #verbatimConfig = ''
           #  nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
           #'';
         };
          onBoot = "start";
         onShutdown = "shutdown";
        };
        spiceUSBRedirection.enable = true; 
        programs.virt-manager.enable = true;

        environment.systemPackages = with pkgs; [ 
          #qemu_full
          #inputs.self.packages.${pkgs.system}.quickemu
          #virt-viewer
          #spice-gtk
          distrobox
          boxbuddy
          gnome.gnome-boxes
        ];
      };  
      boot.extraModprobeConfig = ''
        options kvm_amd nested=1
        options kvm_amd emulate_invalid_guest_state=0
        options kvm ignore_msrs=1
      '';          
    })
  ];
}
