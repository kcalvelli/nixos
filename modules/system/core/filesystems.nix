{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sshfs
    fuse
    ntfs3g
  ];
}
