{ pkgs, lib, inputs, ... }:
{
  imports = [
    ./local.nix
    ./nix.nix
  ];

  # Privacy
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };  

 services.dbus.packages = [ pkgs.gcr ];
 
 environment.systemPackages = with pkgs; [
  ### Common apps
    ### Filesystem
    sshfs
    fuse
    ntfs3g

    ### Utilities
    killall
    mission-center
    gnome-firmware

    # Get stuff
    wget
    curl

    # Info stuff
    pciutils
    wirelesstools
    gtop
    htop
  ];  
}