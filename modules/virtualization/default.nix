{ inputs, config, pkgs, ... }:
{
  virtualisation = {
    libvirtd.enable = true;

    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    distrobox
  ];
} 
