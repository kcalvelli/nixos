{ config, pkgs, ... }:
{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.john = {
    isNormalUser = true;
    description = "John Calvelli";
    extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk""libvirtd" ];
  };
}