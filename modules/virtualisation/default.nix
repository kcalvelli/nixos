{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
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
      #virtualisation.waydroid.enable = true;
    })

    (lib.mkIf cfg.libvirt.enable {
      environment.systemPackages = with pkgs; [
        #virt-manager
        #virt-viewer
        #spice
        #spice-gtk
        #spice-protocol
        #win-virtio
        #win-spice
        #inputs.self.packages.${pkgs.system}.quickemu
        #packages.x86_64-linux.quickemu
        #packages.x86_64-linux.quickgui
        inputs.quickemu.packages.x86_64-linux.default
      ];

      # Manage the virtualisation services
      virtualisation = {
      #  libvirtd = {
      #    enable = true;
      #    qemu = {
      #      swtpm.enable = true;
      #      ovmf.enable = true;
      #      ovmf.packages = [ pkgs.OVMFFull.fd ];
      #    };
      #  };
        spiceUSBRedirection.enable = true;
      };
      services.spice-vdagentd.enable = true;
    })
  ];
}
