{ config, lib, inputs, pkgs, ... }:
let 
  cfg = config.virt;
in  
{

  options = {
    virt.containers = {
      enable = lib.mkEnableOption "Enable containers";
    };
    virt.libvirt = {
      enable = lib.mkEnableOption "Enable libvirt";
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

    (lib.mkIf cfg.libvirt.enable {
      virtualisation = {
       libvirtd = {
         enable = true;
         qemu = {
           ovmf.enable = true;
           ovmf.packages = [ pkgs.OVMFFull.fd ];
           swtpm.enable = true;
         };
          onBoot = "start";
         onShutdown = "shutdown";
        };
        spiceUSBRedirection.enable = true; 
      };

      programs.virt-manager.enable = true;      

      systemd.tmpfiles.rules =
        let
          firmware =
            pkgs.runCommandLocal "qemu-firmware" { } ''
              mkdir $out
              cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
              substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
            '';
        in
        [ "L+ /var/lib/qemu/firmware - - - - ${firmware}" ];

      boot.extraModprobeConfig = ''
        options kvm_amd nested=1
        options kvm_amd emulate_invalid_guest_state=0
        options kvm ignore_msrs=1
      '';  

      # The virt stuff breaks a lot on unstable - keep it on stable 
      environment.systemPackages = with inputs.nixpkgs-stable.legacyPackages.${pkgs.system}; [
        qemu_full
        #qemu
        quickemu
        virt-viewer
        spice-gtk
        distrobox
        boxbuddy
      ];           
    })
  ];
}
