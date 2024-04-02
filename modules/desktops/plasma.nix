# Configure a KDE Plasma Desktop
{ inputs, outputs, config, pkgs, lib, ... }:
{
  imports = [
    ./common.nix
  ];

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
