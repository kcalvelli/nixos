# Configure a KDE Plasma Desktop
{ inputs, pkgs, ... }:
{
  services = {  
      desktopManager = {
        plasma6 = {
          enable = true;
          enableQt5Integration = true;
        };
      };

    dbus.enable = true;
    colord.enable = true;
  };
   
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    #Need these 
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.skanlite
    pkgs.kdePackages.filelight
    pkgs.kdePackages.partitionmanager
    
    #Kaccounts
    pkgs.kdePackages.kaccounts-integration
    pkgs.kdePackages.kaccounts-providers

    #Klassy
    inputs.self.packages.${pkgs.system}.klassy

  ];  

}
