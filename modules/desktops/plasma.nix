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
    displayManager = {
      sddm = {
        enable = true;
        #          settings = {
        #            Autologin = {
        #              Session = "plasma";
        #              User = "keith";
        #            };
        #          };
        wayland = {
          enable = true;
        };
      };
    };
    #    xserver.enable = true;  
    dbus.enable = true;
    colord.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  environment.systemPackages = with pkgs; [
    #Need these 
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.skanlite
    pkgs.kdePackages.filelight

    #Kaccounts
    #pkgs.kdePackages.kaccounts-integration
    #pkgs.kdePackages.kaccounts-providers
    #utterly-nord-plasma
  ];
}
