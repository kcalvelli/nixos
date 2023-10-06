# Configure a KDE Plasma Desktop

{ inputs, config, pkgs, ... }:
{
  
  imports = [
    ../../desktop
  ];

  services = {
    xserver = {
      displayManager = {
        #sddm.enable = true;
        lightdm.enable = true;
        #defaultSession = "plasmawayland";
        # Disable autologin due to wayland SDDM bug, should be resolved in v.20
        #autoLogin.enable = true; 
        #autoLogin.user = "keith";
      };
      
      desktopManager.budgie.enable = true;
    };
  };
}
