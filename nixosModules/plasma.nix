# Configure a KDE Plasma Desktop
{ inputs, outputs, config, pkgs, lib, ... }:
{
  services = {  
      desktopManager = {
        plasma6 = {
          enable = true;
          enableQt5Integration = false;
        };
      };
#      xserver = {
#        displayManager = {
#          sddm.enable = true;
#          sddm.wayland.enable = true;
#          autoLogin.enable = true;
#          autoLogin.user = "keith";
#          defaultSession = "plasma";
#        };
#      };

    dbus.enable = true;
    colord.enable = true;
  };
   
  xdg.portal = {
     enable = true;
  #   gtkUsePortal = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.kdeconnect.enable = true;

}
