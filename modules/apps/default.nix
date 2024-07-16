{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ 
  ### Office    
    libreoffice-fresh
    teams-for-linux 

  ### Utils
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

  ### Virtualisation
    qemu_full
    inputs.self.packages.${pkgs.system}.quickemu
    virt-viewer
    spice-gtk
    distrobox
    boxbuddy

  ### Filesystem
    sshfs
    fuse
    ntfs3g

  ### Development
    nil
    zed-editor
    nixfmt-rfc-style
    (vscode.override {
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        "--gtk-version=4"
        "--password-store=gnome"
      ];
    })

  ### Games
    superTuxKart

  ### Graphics
    lact
    radeontop
    umr
    gimp
    amdgpu_top
    clinfo

  ### Video
    clapper
    gnomecast    
   
  ### Network
    #inputs.self.packages.${pkgs.system}.brave-browser
    brave
    telegram-desktop 
    openssl 
    nextcloud-client
    inputs.self.packages.${pkgs.system}.valent  
  ];  
}
