{ inputs, config, pkgs, ... }:
{
  users.extraUsers.keith.extraGroups = [ "libvirtd" ];
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

  security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";

} 
