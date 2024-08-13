{ pkgs, ... }:
{
  imports = [
    ./networking.nix
    ./desktop.nix
    ./development.nix
    ./gnome-settings.nix
    ./office.nix
    ./pwa.nix
    ./shell.nix
    ./virtualisation.nix
    ./graphics.nix
  ];
  home.packages = with pkgs; [
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

    # That game
    superTuxKart    
  ];
}