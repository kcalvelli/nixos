{ pkgs, ... }:
{
  imports = [
    ./local.nix
    ./nix.nix
  ];

  # Privacy
  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
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
    cubicsdr
    mission-center
    wlogout
    gnome-firmware
    # Rust replacement for gnu coreutils
    uutils-coreutils-noprefix

    # Very Rusty
    bandwhich
    bat
    bottom
    broot
    dua
    dust
    eza
    fd
    helix
    ouch
    procs
    rm-improved
    ripgrep
    skim
    tokei
    xcp
    zoxide

    # Get stuff
    wget
    curl

    # Info stuff
    pciutils
    wirelesstools
    gtop
    iw 

    pinentry-gnome3    
  ];  
}