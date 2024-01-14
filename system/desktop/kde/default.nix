# Configure a KDE Plasma Desktop

{ inputs, config, pkgs, ... }:
{
  
  imports = [
    ../../desktop
  ];

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
   
  xdg.portal = {
     enable = true;
  #   gtkUsePortal = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.partition-manager.enable = true;
}
