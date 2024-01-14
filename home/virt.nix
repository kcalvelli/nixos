{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qemu
    #distrobox
    quickemu
    virt-viewer
    distrobox
    wl-clipboard
  ];
}