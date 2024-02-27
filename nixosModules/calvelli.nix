{ inputs, pkgs, ... }:
{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.calvelli = {
    isNormalUser = true;
    description = "Keith Calvelli";
    extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk""libvirtd" "plugdev" ];
  };
}