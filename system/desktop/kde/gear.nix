{ inputs, config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
     #Need these 
     pkgs.kdePackages.kate
     pkgs.kdePackages.kcalc
     pkgs.kdePackages.skanlite
     pkgs.kdePackages.filelight
     pkgs.kdePackages.kwalletmanager
     pkgs.kdePackages.neochat

     #Kaccounts
     pkgs.kdePackages.kaccounts-integration
     pkgs.kdePackages.kaccounts-providers

     #Kio
     pkgs.kdePackages.kio-extras
     pkgs.kdePackages.kio-gdrive
     pkgs.kdePackages.kio-zeroconf



     #For spam
     bogofilter
     
    ] ++ ( with pkgs.libsForQt5; [
    utterly-round-plasma-style
    #signond
  ] );
}
