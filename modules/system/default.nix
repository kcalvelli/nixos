{ pkgs, ... }:
{
  imports = [
    ./local.nix
    ./nix.nix
  ];

  ### Common apps
  environment.systemPackages = with pkgs; [ 
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
    ptyxis
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
  ];    

  # Privacy
  programs = {
    gnupg.agent = {
      enable = true;
    };
  };  
}