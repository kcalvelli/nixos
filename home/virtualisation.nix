{ ... }:
{
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.packages = with pkgs; [
    #qemu_full
    qemu
    quickemu
    virt-viewer
    spice-gtk
    distrobox
    boxbuddy
  ];
}
