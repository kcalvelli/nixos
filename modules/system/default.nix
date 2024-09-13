{ pkgs, lib, inputs, ... }:
{
  imports = [
    ./local.nix
    ./nix.nix
    inputs.agenix.nixosModules.default
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

}