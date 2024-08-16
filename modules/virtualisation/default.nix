{ config, lib, inputs, pkgs, ... }:
let 
  cfg = config.virt;
  # The virt stuff breaks a lot on unstable - keep it on stable 
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
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
           ovmf.packages = [ pkgs-stable.OVMFFull.fd ];
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
            pkgs-stable.runCommandLocal "qemu-firmware" { } ''
              mkdir $out
              cp ${pkgs-stable.qemu_full}/share/qemu/firmware/*.json $out
              substituteInPlace $out/*.json --replace ${pkgs-stable.qemu_full} /run/current-system/sw
            '';
        in
        [ "L+ /var/lib/qemu/firmware - - - - ${firmware}" ];

      boot.extraModprobeConfig = ''
        options kvm_amd nested=1
        options kvm_amd emulate_invalid_guest_state=0
        options kvm ignore_msrs=1
      '';  

      environment.systemPackages = with pkgs-stable; [
        qemu_full
        OVMFFull
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
