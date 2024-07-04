{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
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

  # Needed to enable fish completions
  programs.fish.enable = true;
}
