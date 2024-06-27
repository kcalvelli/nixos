{ pkgs, ... }:
{

  # Needed to enable fish completions
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # Rust replacement for gnu coreutils
    uutils-coreutils-noprefix

    # Very Rusty
    atuin
    bandwhich
    bat
    bottom
    broot
    dua
    dust
    eza
    fd
    helix
    lfs
    lsd
    macchina
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
    amdgpu_top
    gtop
    iw
  ];
}
