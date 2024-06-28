{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sshfs
    fuse
    ntfs3g
  ];

  services.udisks2.enable = true;  
  services.gvfs.enable = true;
}
