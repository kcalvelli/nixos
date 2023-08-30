# Configure a KDE Plasma Desktop

{ inputs, config, pkgs, ... }:
{
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    partition-manager.enable = true;
  };

  services = {
    xserver = {
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasmawayland";
        # Disable autologin due to wayland SDDM bug, should be resolved in v.20
        autoLogin.enable = false; 
        autoLogin.user = "keith";
      };
      
      desktopManager.plasma5.enable = true;
    };
    dbus.enable = true;
  };

  # Excluded KDE packages go here
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa 
    khelpcenter
    kwrite
  ];

  
  environment.systemPackages = with pkgs; [
    kate
    #libreoffice-qt
    spectacle
    kcalc
    skanlite
    filelight
    ] ++ ( with pkgs.libsForQt5; [
    plasma-browser-integration
    kaccounts-integration
    kaccounts-providers
    kdialog
    kdeconnect-kde
    kio-gdrive
    accounts-qt
  ] );

   
  xdg.portal = {
     enable = true;
  #   gtkUsePortal = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
