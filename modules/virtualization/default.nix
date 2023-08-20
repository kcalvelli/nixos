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
  };

  environment.systemPackages = with pkgs; [
    qemu
    distrobox
    quickemu
    quickgui
    spice-gtk
  ];

  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm_amd emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

 users.groups.usb = {};
  users.users.keith.extraGroups = [ "usb" ];
  services.udev.extraRules = ''
    KERNEL=="*", SUBSYSTEMS=="usb", MODE="0664", GROUP="usb"
  '';
} 
