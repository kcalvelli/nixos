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
     
     #kde-pim
     pkgs.kdePackages.kmail
     pkgs.kdePackages.kmail-account-wizard
     pkgs.kdePackages.kmailtransport

     pkgs.kdePackages.merkuro
     pkgs.kdePackages.kleopatra
     bogofilter

     pkgs.kdePackages.calendarsupport
     pkgs.kdePackages.akonadi-calendar
     pkgs.kdePackages.akonadi-calendar-tools
     pkgs.kdePackages.akonadi-contacts
     pkgs.kdePackages.akonadi-import-wizard
     pkgs.kdePackages.akonadi-mime
     pkgs.kdePackages.akonadiconsole
     pkgs.kdePackages.akonadi-notes
     pkgs.kdePackages.akonadi-search
     pkgs.kdePackages.akonadi
     pkgs.kdePackages.kdepim-addons
     pkgs.kdePackages.kdepim-runtime


     #Kaccounts
     pkgs.kdePackages.kaccounts-integration
     pkgs.kdePackages.kaccounts-providers

     #Kio
     pkgs.kdePackages.kio-extras
     pkgs.kdePackages.kio-gdrive
     pkgs.kdePackages.kio-zeroconf

    ] ++ ( with pkgs.libsForQt5; [
    utterly-round-plasma-style
    #signond
  ] );
}
