{ inputs, config, pkgs, ... }:
{
  users.extraUsers.keith.extraGroups = [ "libvirtd" ];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  waydroid.enable = true;    
  };

  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm_amd emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 8192;
      cores = 4;
    };
  };
  
  environment.systemPackages = with pkgs; [ 
    qemu
    #distrobox
    quickemu
    virt-viewer
    distrobox
    wl-clipboard
  ];    
} 