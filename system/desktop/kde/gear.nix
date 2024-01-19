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

     #kdepim
     pkgs.kdeApplications.kmail
     pkgs.kdeApplications.kmail-account-wizard
     pkgs.kdeApplications.kmailtransport

     pkgs.kdeApplications.merkuro
     pkgs.kdeApplications.kleopatra

     pkgs.kdeApplications.calendarsupport
     pkgs.kdeApplications.akonadi-calendar
     pkgs.kdeApplications.akonadi-calendar-tools
     pkgs.kdeApplications.akonadi-contacts
     pkgs.kdeApplications.akonadi-import-wizard
     pkgs.kdeApplications.akonadi-mime
     pkgs.kdeApplications.akonadiconsole
     pkgs.kdeApplications.akonadi-notes
     pkgs.kdeApplications.akonadi-search
     pkgs.kdeApplications.akonadi
     pkgs.kdeApplications.kdepim-addons
     pkgs.kdeApplications.kdepim-runtime

     #For spam
     bogofilter
     
    ] ++ ( with pkgs.libsForQt5; [
    utterly-round-plasma-style
    #signond
  ] );
}
