{ pkgs, inputs, ... }:

{
  services = {
    #  X11
    xserver = {
      enable  = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
      libinput.enable = true;
    };
  };

  # How about some privacy? 
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [ 
    libva-utils
    wayland-utils
    vulkan-tools
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    pkgs.ibm-plex   
    fuse
    ntfs3g
    sshfs 
    gpgme
    adw-gtk3
    adwaita-qt6
    htop
    bottles
    pciutils
    clinfo
    glxinfo
    xdg-user-dirs
    desktop-file-utils
    usbutils
    aha
    wl-clipboard
    unzip
  ];   

  services= {
    #flatpak.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip pkgs.hplipWithPlugin ];
    };      
  };

  sound.enable = true;
  security.rtkit.enable = true; 
  security.polkit.enable = true;
  fonts.fontconfig.enable = true;
}