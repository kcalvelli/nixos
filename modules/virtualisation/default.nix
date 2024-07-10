{ inputs, pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
      };
    };
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

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    qemu_full
    inputs.self.packages.${pkgs.system}.quickemu
    virt-viewer
    spice-gtk
    gnome.gnome-boxes
    distrobox
    boxbuddy
    swtpm
  ];
}
