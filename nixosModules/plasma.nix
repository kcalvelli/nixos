# Configure a KDE Plasma Desktop
{ inputs, outputs, config, pkgs, lib, ... }:
{
  services = {
    xserver = {
      displayManager = {
        #sddm.enable = true;
        #sddm.wayland.enable = true;
        #defaultSession = "plasma";
        #autoLogin.enable = true; 
        #autoLogin.user = "keith";
      };
      
      desktopManager = {
        plasma6 = {
          enable = true;
          enableQt5Integration = false;
        };
      };
    };
    dbus.enable = true;
    colord.enable = true;
  };
   
  xdg.portal = {
     enable = true;
  #   gtkUsePortal = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.plasma6.excludePackages = [ pkgs.kdePackages.elisa pkgs.kdePackages.oxygen pkgs.kdePackages.oxygen-icons ];
}
