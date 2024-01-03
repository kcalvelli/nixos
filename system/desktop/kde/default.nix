# Configure a KDE Plasma Desktop

{ inputs, config, pkgs, ... }:
{
  
  imports = [
    ../../desktop
  ];

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    partition-manager.enable = true;
  };

  services = {
    xserver = {
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
        #lightdm.enable = true;
        defaultSession = "plasmawayland";
        # Disable autologin due to wayland SDDM bug, should be resolved in v.20
        autoLogin.enable = true; 
        autoLogin.user = "keith";
      };
      
      desktopManager.plasma5.enable = true;
      desktopManager.plasma5.useQtScaling = true;
    };
    dbus.enable = true;
    colord.enable = true;
  };

  # Excluded KDE packages go here
  #environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #  elisa 
  #  khelpcenter
  #  oxygen
  #];

  
  environment.systemPackages = with pkgs; [
    kate
    kcalc
    skanlite
    filelight
    pciutils
    clinfo
    glxinfo
    libva-utils
    wayland-utils
    vulkan-tools
    qt6.qtwayland
    ] ++ ( with pkgs.libsForQt5; [
    kaccounts-integration
    kaccounts-providers
    kdialog
    kio-gdrive
    accounts-qt
    utterly-round-plasma-style
  ] );

   
  xdg.portal = {
     enable = true;
  #   gtkUsePortal = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
