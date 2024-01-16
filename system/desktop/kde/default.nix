# Configure a KDE Plasma Desktop

{ inputs, config, pkgs, ... }:
{
  
  imports = [
    ../../desktop
    #./gear.nix
  ];

  services = {
    xserver = {
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
        defaultSession = "plasmawayland";
        #Uncomment above for plasma5 andcomment below
        #defaultSession = "plasma";
        # Disable autologin due to wayland SDDM bug, should be resolved in v.20
        autoLogin.enable = true; 
        autoLogin.user = "keith";
      };
      
      desktopManager = {
        plasma5 = {
          enable = true;
          useQtScaling = true;        
        };
        #plasma6 = {
        #  enable = false;
        #};
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
  programs.partition-manager.enable = true;

  
}
